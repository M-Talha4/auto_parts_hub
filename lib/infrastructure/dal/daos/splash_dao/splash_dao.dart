import 'package:auto_parts_hub/domain/core/entities/user_entities/user_config.dart';
import 'package:auto_parts_hub/domain/core/interfaces/splash_interface/splash_repository.dart';
import 'package:auto_parts_hub/domain/db/local_storage/my_prefs.dart';

class SplashDao implements SplashRepository {
  @override
  Future<UserConfig> getUserConfig() async {
    return UserConfig(
        isAdmin: MyPrefs.getAdmin(),
        language: MyPrefs.getLanguage(),
        user: MyPrefs.getUser());
  }
}
