import 'dart:async';
import 'dart:io';
import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/domain/core/interfaces/product_interdace/products_repository.dart';
import 'package:auto_parts_hub/domain/exceptions/network_exception.dart';
import 'package:auto_parts_hub/domain/exceptions/time_out_exception.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/product_models/product_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firebase_storage_service.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firestore_services.dart';

class ProductDao extends ProductsRepository {
  final FireStoreServices _fireStoreServices;
  final FirebaseStorageService _firebaseStorageService;
  ProductDao(this._fireStoreServices, this._firebaseStorageService);

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
  Future<void> deleteProduct(String productId) async {
    try {
      await _fireStoreServices.deleteProduct(productId);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addProduct(Product product) async {
    try {
      await _fireStoreServices.addProduct(product as ProductModel);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    try {
      await _fireStoreServices.updateProduct(product as ProductModel);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> uploadImage(File file) async {
    try {
      return await _firebaseStorageService.uploadProductImage(file) ?? '';
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
