import 'dart:io';
import 'dart:async';
import 'package:auto_parts_hub/domain/exceptions/network_exception.dart';
import 'package:auto_parts_hub/domain/exceptions/time_out_exception.dart';
import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/domain/core/interfaces/home_interface/home_repository.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firestore_services.dart';

class HomeDao implements HomeRepository {
  final FireStoreServices _fireStoreServices;
  HomeDao(this._fireStoreServices);
  @override
  Future<List<Product>?> getProducts() async {
    try {
      List<Product> products = await _fireStoreServices.getProductsList();
      return products;
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<Product> searchProducts(String query) {
    List<Product> products = _fireStoreServices.productList.where((product) {
      return product.productBrand.toLowerCase().contains(query) ||
          product.productVehicle.toLowerCase().contains(query) ||
          product.productName.toLowerCase().contains(query) ||
          product.productCategory.toLowerCase().contains(query);
    }).toList();
    return products;
  }
}
