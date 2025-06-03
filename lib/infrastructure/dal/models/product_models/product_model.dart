import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/core/entities/product_entities/product_entity.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  @override
  @JsonKey(name: 'productId')
  final String productId;

  @override
  @JsonKey(name: 'productBrand')
  final String productBrand;

  @override
  @JsonKey(name: 'productCategory')
  final String productCategory;

  @override
  @JsonKey(name: 'productDescription')
  final String productDescription;

  @override
  @JsonKey(name: 'productImage')
  final String productImage;

  @override
  @JsonKey(name: 'productName')
  final String productName;

  @override
  @JsonKey(name: 'productPrice')
  final int productPrice;

  @override
  @JsonKey(name: 'productVehicle')
  final String productVehicle;

  ProductModel({
    required this.productId,
    required this.productBrand,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productVehicle,
  }) : super(
          productId: productId,
          productBrand: productBrand,
          productCategory: productCategory,
          productDescription: productDescription,
          productImage: productImage,
          productName: productName,
          productPrice: productPrice,
          productVehicle: productVehicle,
        );

  // CopyWith method
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

  // Equals method
  bool equals(Object other) {
    return other is ProductModel &&
        other.productId == productId &&
        other.productBrand == productBrand &&
        other.productCategory == productCategory &&
        other.productDescription == productDescription &&
        other.productImage == productImage &&
        other.productName == productName &&
        other.productPrice == productPrice &&
        other.productVehicle == productVehicle;
  }

  // JSON Serialization Methods
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
