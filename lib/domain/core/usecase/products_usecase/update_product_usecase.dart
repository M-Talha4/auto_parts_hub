import '/domain/core/entities/product_entities/product_entity.dart';
import '/domain/core/interfaces/product_interdace/products_repository.dart';

class UpdateProductUsecase {
  final ProductsRepository _productsRepository;
  UpdateProductUsecase(this._productsRepository);

  Future<void> execute(ProductEntity product) {
    return _productsRepository.updateProduct(product);
  }
}
