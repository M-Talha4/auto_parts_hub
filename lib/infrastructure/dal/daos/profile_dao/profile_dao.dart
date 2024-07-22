import 'dart:async';
import 'dart:io';
import 'package:auto_parts_hub/domain/core/interfaces/profile_interface/profile_repository.dart';
import 'package:auto_parts_hub/domain/db/local_storage/my_prefs.dart';
import 'package:auto_parts_hub/domain/exceptions/network_exception.dart';
import 'package:auto_parts_hub/domain/exceptions/time_out_exception.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firebase_storage_service.dart';

class ProfileDao implements ProfileRepository {
  final FirebaseStorageService _firebaseStorageService;
  final AuthServices _authServices;
  ProfileDao(this._firebaseStorageService, this._authServices);

  @override
  Future<String?> uploadImage(File file) async {
    try {
      return await _firebaseStorageService.uploadProfileImage(file) ?? '';
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProfile(UserModel user) async {
    try {
      await _authServices.updateUserCollection(user);
      MyPrefs.storeUser(user: user);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
