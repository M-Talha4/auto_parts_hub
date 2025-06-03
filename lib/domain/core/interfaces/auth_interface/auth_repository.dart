import '/infrastructure/dal/models/user_models/user_model.dart';

abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> signup(UserModel user, String password);
  Future<void> forgotPassword(String email);
  Future<void> logout();
}
