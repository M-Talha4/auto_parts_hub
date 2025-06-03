// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      itemId: json['itemId'] as String? ?? '',
      itemName: json['itemName'] as String? ?? '',
      itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
      itemImage: json['itemImage'] as String? ?? '',
      itemPrice: (json['itemPrice'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'itemCount': instance.itemCount,
      'itemImage': instance.itemImage,
      'itemPrice': instance.itemPrice,
    };
