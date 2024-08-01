import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/domain/core/interfaces/product_interdace/products_repository.dart';

class UpdateProductUsecase {
  final ProductsRepository _productsRepository;
  UpdateProductUsecase(this._productsRepository);

  Future<void> execute(Product product) {
    return _productsRepository.updateProduct(product);
  }
}
