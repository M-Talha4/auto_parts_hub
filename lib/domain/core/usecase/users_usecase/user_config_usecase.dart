import 'package:auto_parts_hub/domain/core/entities/user_entities/user_config.dart';
import 'package:auto_parts_hub/domain/core/interfaces/splash_interface/splash_repository.dart';

class UserConfigUsecase {
  final SplashRepository _splashRepository;
  UserConfigUsecase(this._splashRepository);

  Future<UserConfig> execute() {
    return _splashRepository.getUserConfig();
  }
}
