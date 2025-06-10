import 'dart:io';
import 'dart:async';
import '../../services/firebase_services/user_services.dart';
import '/infrastructure/dal/services/language_services/language_services.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '/domain/db/local_storage/my_prefs.dart';
import '/domain/exceptions/auth_exceptions.dart';
import '/domain/exceptions/network_exception.dart';
import '/domain/exceptions/time_out_exception.dart';
import '/infrastructure/dal/models/user_models/user_model.dart';
import '/domain/core/interfaces/auth_interface/auth_repository.dart';
import '/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:get/get.dart';
import '../../services/firebase_services/notification_services.dart';

class AuthDao implements AuthRepository {
  final AuthServices _authServices;
  final NotificationServices _notificationServices;
  AuthDao(this._authServices, this._notificationServices);

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _authServices.resetPassword(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw AuthExceptions.firebaseExceptions(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      bool isAdmin = email.contains('@admin.com');

      UserModel user = await _authServices
          .loginWithEmailAndPassword(email, password)
          .then((userId) async {
        await _notificationServices.getFCMToken();
        await _notificationServices.updateToken(userId);

        return isAdmin
            ? await _authServices.getAdminCollection()
            : await _authServices.getUserCollection();
      });
      Get.find<UserServices>().updateUser(user);
      Get.updateLocale(
          LanguageServices.instance.onLanguageSelected(user.language));
      MyPrefs.storeLanguage(language: user.language);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw AuthExceptions.firebaseExceptions(e);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signup(UserModel user, String password) async {
    try {
      if (user.email == 'admin@admin.com') user = user.copyWith(isAdmin: true);
      user = user.copyWith(fcmToken: await _notificationServices.getFCMToken());
      await _authServices
          .signUpWithEmailAndPassword(user, password)
          .then((userID) {
        user = user.copyWith(userId: userID);
        user.isAdmin == true
            ? _authServices.createAdminCollection(user)
            : _authServices.createUserCollection(user);
        Get.find<UserServices>().updateUser(user);
      });
      MyPrefs.storeLanguage(language: user.language);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw AuthExceptions.firebaseExceptions(e);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _notificationServices
          .removeToken(Get.find<UserServices>().user.value.userId);
      Get.find<UserServices>().updateUser(null);
      await _authServices.logout();
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw AuthExceptions.firebaseExceptions(e);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
