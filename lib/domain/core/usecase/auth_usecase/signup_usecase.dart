import '/infrastructure/dal/models/user_models/user_model.dart';
import '/domain/core/interfaces/auth_interface/auth_repository.dart';

class SignupUsecase {
  final AuthRepository _authRepository;
  SignupUsecase(this._authRepository);

  Future<void> execute(UserModel user, String password) {
    return _authRepository.signup(user, password);
  }
}
