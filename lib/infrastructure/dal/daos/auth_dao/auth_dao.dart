import 'dart:io';
import 'dart:async';
import 'package:auto_parts_hub/infrastructure/dal/services/language_services/language_services.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:auto_parts_hub/domain/db/local_storage/my_prefs.dart';
import 'package:auto_parts_hub/domain/exceptions/auth_exceptions.dart';
import 'package:auto_parts_hub/domain/exceptions/network_exception.dart';
import 'package:auto_parts_hub/domain/exceptions/time_out_exception.dart';
import 'package:auto_parts_hub/domain/core/entities/user_entities/user.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';
import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:get/get.dart';

class AuthDao implements AuthRepository {
  final AuthServices _authServices;
  AuthDao(this._authServices);

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
  Future<void> login({required String email, required String password}) async {
    try {
      User user = await _authServices
          .loginWithEmailAndPassword(email, password)
          .then(
              (userId) async => await _authServices.getUserCollection(userId));
      Get.updateLocale(
          LanguageServices.instance.onLanguageSelected(user.language));
      MyPrefs.storeLanguage(language: user.language);
      MyPrefs.storeAdmin(isAdmin: user.isAdmin);
      MyPrefs.storeUser(user: user);
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
      if (user.email.contains('@admin.com')) user.isAdmin = true;
      await _authServices
          .signUpWithEmailAndPassword(user, password)
          .then((userID) {
        user.userId = userID!;
        _authServices.createUserCollection(user);
      });
      MyPrefs.storeLanguage(language: user.language);
      MyPrefs.storeAdmin(isAdmin: user.isAdmin);
      MyPrefs.storeUser(user: user);
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
