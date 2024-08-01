import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';

abstract class HomeRepository {
  List<Product> searchProducts(String query);
}
