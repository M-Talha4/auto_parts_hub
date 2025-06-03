import 'dart:io';

import '/domain/core/entities/product_entities/product_entity.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>?> getProducts();
  Future<void> deleteProduct(String productId);
  Future<String> uploadImage(File file);
  Future<void> addProduct(ProductEntity product);
  Future<void> updateProduct(ProductEntity product);
}
