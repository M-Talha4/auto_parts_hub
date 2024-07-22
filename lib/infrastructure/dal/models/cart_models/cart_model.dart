import 'dart:convert';
import 'package:auto_parts_hub/domain/core/entities/cart_entities/cart.dart';

class CartModel extends Cart {
  CartModel({
    required super.itemId,
    required super.itemName,
    required super.itemCount,
    required super.itemImage,
    required super.itemPrice,
  });

  CartModel copyWith({
    String? itemId,
    String? itemName,
    int? itemCount,
    String? itemImage,
    int? itemPrice,
  }) {
    return CartModel(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      itemCount: itemCount ?? this.itemCount,
      itemImage: itemImage ?? this.itemImage,
      itemPrice: itemPrice ?? this.itemPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemId': itemId,
      'itemName': itemName,
      'itemCount': itemCount,
      'itemImage': itemImage,
      'itemPrice': itemPrice,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      itemId: map['itemId'] as String,
      itemName: map['itemName'] as String,
      itemCount: map['itemCount'] as int,
      itemImage: map['itemImage'] as String,
      itemPrice: map['itemPrice'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(itemId: $itemId, itemName: $itemName, itemCount: $itemCount, itemImage: $itemImage, itemPrice: $itemPrice)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.itemId == itemId &&
        other.itemName == itemName &&
        other.itemCount == itemCount &&
        other.itemImage == itemImage &&
        other.itemPrice == itemPrice;
  }

  @override
  int get hashCode {
    return itemId.hashCode ^
        itemName.hashCode ^
        itemCount.hashCode ^
        itemImage.hashCode ^
        itemPrice.hashCode;
  }
}
