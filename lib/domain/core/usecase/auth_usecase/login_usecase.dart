import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';

class LoginUsecase {
  final AuthRepository _authRepository;
  LoginUsecase(this._authRepository);

  Future<void> execute(String email, String password) async {
    return await _authRepository.login(email, password);
  }
}
