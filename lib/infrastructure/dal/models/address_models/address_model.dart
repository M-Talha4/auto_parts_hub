import 'dart:convert';
import 'package:auto_parts_hub/domain/core/entities/address_entities/address.dart';

class AddressModel extends Address {
  AddressModel(
      {required super.id,
      required super.name,
      required super.address,
      required super.city,
      required super.postalCode});

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'postalCode': postalCode,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      postalCode: map['postalCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(id: $id, name: $name, address: $address, city: $city, postalCode: $postalCode)';
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.city == city &&
        other.postalCode == postalCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        city.hashCode ^
        postalCode.hashCode;
  }
}
