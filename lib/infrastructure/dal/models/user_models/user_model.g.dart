// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool,
      language: json['language'] as String,
      phoneNo: json['phoneNo'] as String,
      profileImage: json['profileImage'] as String,
      fcmToken: json['fcmToken'] as String? ?? '',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
      'language': instance.language,
      'phoneNo': instance.phoneNo,
      'profileImage': instance.profileImage,
      'fcmToken': instance.fcmToken,
    };
