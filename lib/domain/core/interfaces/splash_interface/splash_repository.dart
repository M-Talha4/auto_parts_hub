import 'package:auto_parts_hub/domain/core/entities/user_entities/user_config.dart';

abstract class SplashRepository {
  Future<UserConfig> getUserConfig();
}
