import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';
import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';

class SignupUsecase {
  final AuthRepository _authRepository;
  SignupUsecase(this._authRepository);

  Future<void> execute(UserModel user, String password) {
    return _authRepository.signup(user, password);
  }
}
