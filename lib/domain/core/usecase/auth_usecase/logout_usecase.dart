import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository _authRepository;
  LogoutUsecase(this._authRepository);

  Future<void> execute() {
    return _authRepository.logout();
  }
}
