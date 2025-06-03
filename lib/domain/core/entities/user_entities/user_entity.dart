abstract class UserEntity {
  final String _userId;
  final String _name;
  final String _email;
  final bool _isAdmin;
  final String _language;
  final String _phoneNo;
  final String _profileImage;
  final String _fcmToken;

  UserEntity({
    required String userId,
    required String name,
    required String email,
    required bool isAdmin,
    required String language,
    required String phoneNo,
    required String profileImage,
    required String fcmToken,
  })  : _userId = userId,
        _name = name,
        _email = email,
        _isAdmin = isAdmin,
        _language = language,
        _phoneNo = phoneNo,
        _profileImage = profileImage,
        _fcmToken = fcmToken;

  String get userId => _userId;
  String get name => _name;
  String get email => _email;
  bool get isAdmin => _isAdmin;
  String get language => _language;
  String get phoneNo => _phoneNo;
  String get profileImage => _profileImage;
  String get fcmToken => _fcmToken;
}
