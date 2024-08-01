import 'package:auto_parts_hub/domain/core/entities/order_entities/order.dart';
import 'package:auto_parts_hub/domain/core/usecase/orders_usecase/change_order_status_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/orders_usecase/get_all_orders_usecase.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageOrdersController extends GetxController
    with GetTickerProviderStateMixin {
  final GetAllOrdersUsecase _allOrdersUsecase;
  final ChangeOrderStatusUsecase _changeOrderStatusUsecase;
  ManageOrdersController(
      this._allOrdersUsecase, this._changeOrderStatusUsecase);

  late TabController tabController;
  RxList<Orders> orderList = RxList.empty();

  @override
  void onInit() {
    getAllOrders();
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  void onOrderStatusChange(String orderId, String orderStatus) async {
    try {
      await _changeOrderStatusUsecase.execute(orderId, orderStatus);
      orderList.removeWhere((order) => order.orderId == orderId);
      getAllOrders();
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.e(e);
      }
    }
  }

  Future<void> getAllOrders() async {
    try {
      List<Orders> orders = await _allOrdersUsecase.execute() ?? [];
      orderList.addAll(orders.where((newOrder) => !orderList
          .any((existingOrder) => existingOrder.orderId == newOrder.orderId)));
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.e(e);
      }
    }
  }
}
