import 'dart:io';
import '/infrastructure/dal/models/user_models/user_model.dart';

abstract class ProfileRepository {
  Future<String?> uploadImage(File file);
  Future<void> updateProfile(UserModel user);
}
