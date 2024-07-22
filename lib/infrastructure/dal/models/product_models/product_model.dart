import 'dart:convert';
import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.productId,
    required super.productBrand,
    required super.productCategory,
    required super.productDescription,
    required super.productImage,
    required super.productName,
    required super.productPrice,
    required super.productVehicle,
  });

  ProductModel copyWith({
    String? productId,
    String? productBrand,
    String? productCategory,
    String? productDescription,
    String? productImage,
    String? productName,
    int? productPrice,
    String? productVehicle,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      productBrand: productBrand ?? this.productBrand,
      productCategory: productCategory ?? this.productCategory,
      productDescription: productDescription ?? this.productDescription,
      productImage: productImage ?? this.productImage,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productVehicle: productVehicle ?? this.productVehicle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productBrand': productBrand,
      'productCategory': productCategory,
      'productDescription': productDescription,
      'productImage': productImage,
      'productName': productName,
      'productPrice': productPrice,
      'productVehicle': productVehicle,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'] as String,
      productBrand: map['productBrand'] as String,
      productCategory: map['productCategory'] as String,
      productDescription: map['productDescription'] as String,
      productImage: map['productImage'] as String,
      productName: map['productName'] as String,
      productPrice: map['productPrice'] as int,
      productVehicle: map['productVehicle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(productId: $productId, productBrand: $productBrand, productCategory: $productCategory, productDescription: $productDescription, productImage: $productImage, productName: $productName, productPrice: $productPrice, productVehicle: $productVehicle)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.productBrand == productBrand &&
        other.productCategory == productCategory &&
        other.productDescription == productDescription &&
        other.productImage == productImage &&
        other.productName == productName &&
        other.productPrice == productPrice &&
        other.productVehicle == productVehicle;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        productBrand.hashCode ^
        productCategory.hashCode ^
        productDescription.hashCode ^
        productImage.hashCode ^
        productName.hashCode ^
        productPrice.hashCode ^
        productVehicle.hashCode;
  }
}
