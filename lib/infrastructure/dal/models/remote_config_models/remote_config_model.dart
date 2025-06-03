import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/const/const.dart';
import '../../../../domain/core/entities/remote_config_entities/remote_config_entity.dart';

part 'remote_config_model.g.dart';

@JsonSerializable()
class RemoteConfigModel extends RemoteConfigEntity {
  @override
  @JsonKey(name: SERVICE_ACCOUNT_KEY, defaultValue: '')
  String serviceAccountKey;

  RemoteConfigModel({
    required this.serviceAccountKey,
  }) : super(serviceAccountKey: serviceAccountKey);

  // CopyWith method for creating a copy with optional modifications
  RemoteConfigModel copyWith({
    String? serviceAccountKey,
  }) {
    return RemoteConfigModel(
      serviceAccountKey: serviceAccountKey ?? this.serviceAccountKey,
    );
  }

  // Factory constructor for creating an instance from JSON
  factory RemoteConfigModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigModelFromJson(json);

  // Method for converting this instance to JSON
  Map<String, dynamic> toJson() => _$RemoteConfigModelToJson(this);
}
