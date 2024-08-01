import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/domain/core/interfaces/product_interdace/products_repository.dart';

class AddProductUsecase {
  final ProductsRepository _productsRepository;
  AddProductUsecase(this._productsRepository);

  Future<void> execute(Product product) {
    return _productsRepository.addProduct(product);
  }
}
