import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/domain/core/interfaces/home_interface/home_repository.dart';

class GetProductsUsecase {
  final HomeRepository _homeRepository;
  GetProductsUsecase(this._homeRepository);

  Future<List<Product>?> execute() {
    return _homeRepository.getProducts();
  }
}
