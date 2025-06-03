import '/domain/core/interfaces/product_interdace/products_repository.dart';

class DeleteProductUsecase {
  final ProductsRepository _productsRepository;
  DeleteProductUsecase(this._productsRepository);

  Future<void> execute(String productId) {
    return _productsRepository.deleteProduct(productId);
  }
}
