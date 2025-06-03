import '/domain/core/interfaces/home_interface/home_repository.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';
import '../../../../domain/core/entities/product_entities/product_entity.dart';
import '../../models/product_models/product_model.dart';

class HomeDao implements HomeRepository {
  final FireStoreServices _fireStoreServices;
  HomeDao(this._fireStoreServices);

  @override
  List<ProductModel> searchProducts(String query) {
    List<ProductEntity> products =
        _fireStoreServices.productList.where((product) {
      return product.productBrand.toLowerCase().contains(query) ||
          product.productVehicle.toLowerCase().contains(query) ||
          product.productName.toLowerCase().contains(query) ||
          product.productCategory.toLowerCase().contains(query);
    }).toList();
    return products as List<ProductModel>;
  }
}
