import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';

abstract class AuthRepository {
  Future<void> login({required String email, required String password});
  Future<void> signup(UserModel user, String password);
  Future<void> forgotPassword(String email);
  Future<void> logout();
}
