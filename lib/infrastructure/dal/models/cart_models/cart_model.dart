import 'package:json_annotation/json_annotation.dart';
import '/domain/core/entities/cart_entities/cart_entity.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel extends CartEntity {
  @override
  @JsonKey(name: 'itemId', defaultValue: '')
  final String itemId;

  @override
  @JsonKey(name: 'itemName', defaultValue: '')
  final String itemName;

  @override
  @JsonKey(name: 'itemCount', defaultValue: 0)
  final int itemCount;

  @override
  @JsonKey(name: 'itemImage', defaultValue: '')
  final String itemImage;

  @override
  @JsonKey(name: 'itemPrice', defaultValue: 0)
  final int itemPrice;

  CartModel({
    required this.itemId,
    required this.itemName,
    required this.itemCount,
    required this.itemImage,
    required this.itemPrice,
  }) : super(
          itemId: itemId,
          itemName: itemName,
          itemCount: itemCount,
          itemImage: itemImage,
          itemPrice: itemPrice,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

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

  // equals method to compare two instances
  bool equals(CartModel other) {
    return itemId == other.itemId &&
        itemName == other.itemName &&
        itemCount == other.itemCount &&
        itemImage == other.itemImage &&
        itemPrice == other.itemPrice;
  }
}
