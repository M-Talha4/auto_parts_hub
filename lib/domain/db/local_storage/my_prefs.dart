import 'dart:convert';

import '../../const/static_data.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/entities/user_entities/user_entity.dart';
import '../../../infrastructure/dal/models/user_models/user_model.dart';

class MyPrefs {
  static final GetStorage _getStorage = GetStorage();
  static const String _user = 'user';
  static const String _isAdmin = 'isAdmin';
  static const String _language = 'language';
  static const String _isDarkTheme = 'isDarkTheme';

  static storeUser({required UserEntity user}) {
    _getStorage.write(_user, user);
    StaticData.userId = user.userId;
    StaticData.name = user.name;
    StaticData.email = user.email;
    StaticData.phoneNo = user.phoneNo;
    StaticData.isAdmin = user.isAdmin;
    StaticData.language = user.language;
    StaticData.profileImage = user.profileImage;
  }

  static storeLanguage({required String language}) {
    _getStorage.write(_language, language);
    StaticData.language = language;
  }

  static storeAdmin({required bool isAdmin}) {
    _getStorage.write(_isAdmin, isAdmin);
    StaticData.isAdmin = isAdmin;
  }

  static storeTheme({required bool isDarkMode}) {
    _getStorage.write(_isDarkTheme, isDarkMode);
  }

  static UserModel? getUser() {
    String? userJson = _getStorage.read(_user);
    UserModel? user =
        userJson != null ? UserModel.fromJson(jsonDecode(userJson)) : null;
    if (user != null) {
      StaticData.userId = user.userId;
      StaticData.name = user.name;
      StaticData.email = user.email;
      StaticData.phoneNo = user.phoneNo;
      StaticData.isAdmin = user.isAdmin;
      StaticData.language = user.language;
      StaticData.profileImage = user.profileImage;
    }
    return user;
  }

  static bool? getTheme() {
    return _getStorage.read(_isDarkTheme);
  }

  static bool? getAdmin() {
    StaticData.isAdmin = _getStorage.read(_isAdmin) ?? false;
    return _getStorage.read(_isAdmin);
  }

  static String? getLanguage() {
    StaticData.language = _getStorage.read(_language) ?? 'english';
    return _getStorage.read(_language);
  }

  static removeTheme() {
    _getStorage.remove(_isDarkTheme);
  }

  static removeUser() {
    _getStorage.remove(_user);
    StaticData.userId = '';
    StaticData.name = '';
    StaticData.email = '';
    StaticData.phoneNo = '';
    StaticData.isAdmin = false;
    StaticData.language = '';
    StaticData.profileImage = '';
  }
}
