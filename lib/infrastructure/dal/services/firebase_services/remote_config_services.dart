import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import '../../../../domain/const/const.dart';
import '../../../../domain/utils/logger.dart';
import '../../models/remote_config_models/remote_config_model.dart';

class RemoteConfigServices extends GetxService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  RemoteConfigModel remoteConfigModel = RemoteConfigModel.fromJson({});

  // Initialize Firebase Remote Config
  Future<void> initializeRemoteConfig() async {
    // Set Default Configs
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
          fetchTimeout: Duration(seconds: 10),
          minimumFetchInterval: Duration.zero),
    );
    await _remoteConfig.setDefaults({
      SERVICE_ACCOUNT_KEY: '',
    });

    // Fetch remote config values
    try {
      Logger.info(message: 'Initializing Remote Config');
      await _remoteConfig.fetchAndActivate();

      Logger.info(message: 'Remote Config Initialized');

      _checkForUpdates();
      _remoteConfig.onConfigUpdated.listen((event) async {
        Logger.info(message: 'Listening');
        await _remoteConfig.activate();
        _checkForUpdates();
      });
      // addListernerToConfig();
    } catch (e) {
      Logger.error(message: 'Error fetching remote config: $e');
    }
  }

  // Check for updates from remote config
  void _checkForUpdates() async {
    Logger.info(message: 'Checking');

    var allConfigs = _remoteConfig.getAll();
    final Map<String, dynamic> remoteData =
        allConfigs.map((key, value) => MapEntry(key, value.asString()));
    remoteConfigModel = RemoteConfigModel.fromJson(remoteData);
  }
}
