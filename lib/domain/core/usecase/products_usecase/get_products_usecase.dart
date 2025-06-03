import '/domain/core/entities/product_entities/product_entity.dart';
import '/domain/core/interfaces/product_interdace/products_repository.dart';

class GetProductsUsecase {
  final ProductsRepository _productsRepository;
  GetProductsUsecase(this._productsRepository);

  Future<List<ProductEntity>?> execute() {
    return _productsRepository.getProducts();
  }
}
