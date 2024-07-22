import '../../../../infrastructure/dal/models/user_models/user_model.dart';

class UserConfig {
  UserModel? user;
  String? language;
  bool? isAdmin;
  UserConfig({this.user, this.language, this.isAdmin});
}
