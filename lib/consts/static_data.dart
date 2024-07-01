import '/consts/const.dart';
import '/utils/sharepreference_helper.dart';

class StaticData {
  static String accessToken = '';
  static String refreshToken = '';
  static String userId = SharedPreferencesHelper.getString(spUserID) ?? '';
  static String name = SharedPreferencesHelper.getString(spName) ?? '';
  static String email = SharedPreferencesHelper.getString(spEmail) ?? '';
  static String phoneNo = SharedPreferencesHelper.getString(spPhoneNO) ?? '';
  static String profileImage =
      SharedPreferencesHelper.getString(spProfileImage) ?? '';
  static String langyuage = SharedPreferencesHelper.getString(spLanguage) ?? '';
}
