import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/domain/core/interfaces/product_interdace/products_repository.dart';

class GetProductsUsecase {
  final ProductsRepository _productsRepository;
  GetProductsUsecase(this._productsRepository);

  Future<List<Product>?> execute() {
    return _productsRepository.getProducts();
  }
}
