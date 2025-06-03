// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteConfigModel _$RemoteConfigModelFromJson(Map<String, dynamic> json) =>
    RemoteConfigModel(
      serviceAccountKey: json['service_account_key'] as String? ?? '',
    );

Map<String, dynamic> _$RemoteConfigModelToJson(RemoteConfigModel instance) =>
    <String, dynamic>{
      'service_account_key': instance.serviceAccountKey,
    };
