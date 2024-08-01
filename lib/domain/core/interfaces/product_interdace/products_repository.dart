import 'dart:io';

import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>?> getProducts();
  Future<void> deleteProduct(String productId);
  Future<String> uploadImage(File file);
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
}
