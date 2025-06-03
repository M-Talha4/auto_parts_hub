import 'dart:async';
import 'dart:io';
import '/domain/core/interfaces/cart_interface/cart_repository.dart';
import '/domain/exceptions/network_exception.dart';
import '/domain/exceptions/time_out_exception.dart';
import '/infrastructure/dal/models/cart_models/cart_model.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';

class CartDao implements CartRepository {
  final FireStoreServices _fireStoreServices;
  CartDao(this._fireStoreServices);

  @override
  Future<String?> addToCart(CartModel cartItem) async {
    try {
      return await _fireStoreServices.addCartItems(cartItem);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CartModel>> getCartItems() async {
    try {
      return await _fireStoreServices.getCartItems();
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateCart(String itemId, int count) async {
    try {
      await _fireStoreServices.updateCartItems(itemId: itemId, count: count);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCartItem(String itemId) async {
    try {
      await _fireStoreServices.deleteCartItems(itemId);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
