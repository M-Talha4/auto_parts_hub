import '../../interfaces/splash_interface/splash_repository.dart';

class GetCurrentUserUsecase {
  final SplashRepository _splashRepository;
  GetCurrentUserUsecase(this._splashRepository);

  Future<void> execute() {
    return _splashRepository.getCurrentUser();
  }
}
