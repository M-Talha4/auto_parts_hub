import 'dart:async';
import 'dart:io';
import '/domain/core/interfaces/profile_interface/profile_repository.dart';
import '/domain/db/local_storage/my_prefs.dart';
import '/domain/exceptions/network_exception.dart';
import '/domain/exceptions/time_out_exception.dart';
import '/infrastructure/dal/models/user_models/user_model.dart';
import '/infrastructure/dal/services/firebase_services/auth_services.dart';
import '/infrastructure/dal/services/firebase_services/firebase_storage_service.dart';

import '../../services/firebase_services/notification_services.dart';

class ProfileDao implements ProfileRepository {
  final FirebaseStorageService _firebaseStorageService;
  final AuthServices _authServices;
  final NotificationServices _notificationServices;

  ProfileDao(this._firebaseStorageService, this._authServices,
      this._notificationServices);

  @override
  Future<String?> uploadImage(File file) async {
    try {
      return await _firebaseStorageService.uploadProfileImage(file);
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
      user = user.copyWith(fcmToken: await _notificationServices.getFCMToken());
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
