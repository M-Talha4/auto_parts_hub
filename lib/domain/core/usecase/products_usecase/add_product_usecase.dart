import '/domain/core/entities/product_entities/product_entity.dart';
import '/domain/core/interfaces/product_interdace/products_repository.dart';

class AddProductUsecase {
  final ProductsRepository _productsRepository;
  AddProductUsecase(this._productsRepository);

  Future<void> execute(ProductEntity product) {
    return _productsRepository.addProduct(product);
  }
}
