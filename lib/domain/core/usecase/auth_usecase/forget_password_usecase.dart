import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';

class ForgetPasswordUsecase {
  final AuthRepository _authRepository;
  ForgetPasswordUsecase(this._authRepository);

  Future<void> execute(String email) {
    return _authRepository.forgotPassword(email);
  }
}
