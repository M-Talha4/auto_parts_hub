// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productId: json['productId'] as String,
      productBrand: json['productBrand'] as String,
      productCategory: json['productCategory'] as String,
      productDescription: json['productDescription'] as String,
      productImage: json['productImage'] as String,
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toInt(),
      productVehicle: json['productVehicle'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productBrand': instance.productBrand,
      'productCategory': instance.productCategory,
      'productDescription': instance.productDescription,
      'productImage': instance.productImage,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productVehicle': instance.productVehicle,
    };
