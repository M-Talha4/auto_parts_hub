import 'package:json_annotation/json_annotation.dart';
import '/domain/core/entities/address_entities/address_entity.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel extends AddressEntity {
  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @override
  @JsonKey(name: 'address', defaultValue: '')
  final String address;

  @override
  @JsonKey(name: 'city', defaultValue: '')
  final String city;

  @override
  @JsonKey(name: 'postalCode', defaultValue: '')
  final String postalCode;

  AddressModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.postalCode,
  }) : super(
          id: id,
          name: name,
          address: address,
          city: city,
          postalCode: postalCode,
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  // CopyWith method to create a new instance with optional changes
  AddressModel copyWith({
    String? id,
    String? name,
    String? address,
    String? city,
    String? postalCode,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
    );
  }

  // equals method to compare two instances
  bool equals(AddressModel other) {
    return id == other.id &&
        name == other.name &&
        address == other.address &&
        city == other.city &&
        postalCode == other.postalCode;
  }
}
