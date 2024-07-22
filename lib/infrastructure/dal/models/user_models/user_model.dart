import 'dart:convert';
import 'package:auto_parts_hub/domain/core/entities/user_entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.userId,
    required super.name,
    required super.email,
    required super.isAdmin,
    required super.language,
    required super.phoneNo,
    required super.profileImage,
  });

  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
    bool? isAdmin,
    String? language,
    String? phoneNo,
    String? profileImage,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      isAdmin: isAdmin ?? this.isAdmin,
      language: language ?? this.language,
      phoneNo: phoneNo ?? this.phoneNo,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'email': email,
      'isAdmin': isAdmin,
      'language': language,
      'phoneNo': phoneNo,
      'profileImage': profileImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      isAdmin: map['isAdmin'] as bool,
      language: map['language'] as String,
      phoneNo: map['phoneNo'] as String,
      profileImage: map['profileImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(userId: $userId, name: $name, email: $email,  isAdmin: $isAdmin, language: $language, phoneNo: $phoneNo, profileImage: $profileImage)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.name == name &&
        other.email == email &&
        other.isAdmin == isAdmin &&
        other.language == language &&
        other.phoneNo == phoneNo &&
        other.profileImage == profileImage;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        isAdmin.hashCode ^
        language.hashCode ^
        phoneNo.hashCode ^
        profileImage.hashCode;
  }
}
