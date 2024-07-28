import 'dart:async';
import 'dart:io';

import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/core/entities/order_entities/order.dart';
import 'package:auto_parts_hub/domain/core/interfaces/orders_interface/orders_repository.dart';
import 'package:auto_parts_hub/domain/exceptions/network_exception.dart';
import 'package:auto_parts_hub/domain/exceptions/time_out_exception.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/order_models/order_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firestore_services.dart';

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
  Future<List<Orders>?> getOrders() async {
    try {
      return await _fireStoreServices.getOrdersList().then((orders) => orders
          ?.where((order) => order.customerId == StaticData.userId)
          .toList());
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
