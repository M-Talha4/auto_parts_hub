import 'dart:io';
import 'dart:async';
import '/domain/const/static_data.dart';
import '/domain/core/interfaces/orders_interface/orders_repository.dart';
import '/domain/exceptions/network_exception.dart';
import '/domain/exceptions/time_out_exception.dart';
import '/infrastructure/dal/models/order_models/order_model.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';

class OrderDao implements OrdersRepository {
  final FireStoreServices _fireStoreServices;
  OrderDao(this._fireStoreServices);

  @override
  Future<void> submitOrder(OrdersModel order) async {
    try {
      await _fireStoreServices.submitOrder(order);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrdersModel>> getUserOrders() async {
    try {
      return await _fireStoreServices.getOrdersList().then((orders) => orders
          .where((order) => order.customerId == StaticData.userId)
          .toList());
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrdersModel>> getAllOrders() async {
    try {
      return await _fireStoreServices.getOrdersList();
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> changeOrderStatus(String orderId, String orderStatus) async {
    try {
      await _fireStoreServices.updateOrder(orderId, orderStatus);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
