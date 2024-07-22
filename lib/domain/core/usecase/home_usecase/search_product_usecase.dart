import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/domain/core/interfaces/home_interface/home_repository.dart';

class SearchProductUsecase {
  final HomeRepository _homeRepository;
  SearchProductUsecase(this._homeRepository);

  List<Product> execute(String query) {
    return _homeRepository.searchProducts(query);
  }
}
