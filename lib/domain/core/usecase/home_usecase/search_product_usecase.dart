import '/domain/core/entities/product_entities/product_entity.dart';
import '/domain/core/interfaces/home_interface/home_repository.dart';

class SearchProductUsecase {
  final HomeRepository _homeRepository;
  SearchProductUsecase(this._homeRepository);

  List<ProductEntity> execute(String query) {
    return _homeRepository.searchProducts(query);
  }
}
