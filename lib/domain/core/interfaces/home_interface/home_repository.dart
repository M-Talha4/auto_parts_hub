import '/domain/core/entities/product_entities/product_entity.dart';

abstract class HomeRepository {
  List<ProductEntity> searchProducts(String query);
}
