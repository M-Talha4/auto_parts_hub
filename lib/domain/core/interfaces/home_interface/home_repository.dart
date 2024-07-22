import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';

abstract class HomeRepository {
  Future<List<Product>?> getProducts();
  List<Product> searchProducts(String query);
}
