import 'dart:convert';
import '../../../../domain/core/entities/user_entities/user_config.dart';
import 'user_model.dart';

class UserConfigModel extends UserConfig {
  UserConfigModel({
    super.user,
    super.language,
    super.isAdmin,
  });

  UserConfigModel copyWith({
    UserModel? user,
    String? language,
    bool? isAdmin,
  }) {
    return UserConfigModel(
      user: user ?? this.user,
      language: language ?? this.language,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user?.toMap(),
      'language': language,
      'isAdmin': isAdmin,
    };
  }

  factory UserConfigModel.fromMap(Map<String, dynamic> map) {
    return UserConfigModel(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      language: map['language'] != null ? map['language'] as String : null,
      isAdmin: map['isAdmin'] != null ? map['isAdmin'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserConfigModel.fromJson(String source) =>
      UserConfigModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserConfig(userId: $user, language: $language, isAdmin: $isAdmin)';

  @override
  bool operator ==(covariant UserConfigModel other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.language == language &&
        other.isAdmin == isAdmin;
  }

  @override
  int get hashCode => user.hashCode ^ language.hashCode ^ isAdmin.hashCode;
}
