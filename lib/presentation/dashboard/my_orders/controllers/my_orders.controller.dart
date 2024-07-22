import 'package:auto_parts_hub/domain/core/entities/order_entities/order.dart';
import 'package:auto_parts_hub/domain/core/usecase/orders_usecase/get_orders_usecase.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:auto_parts_hub/presentation/dashboard/my_orders/module/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrdersController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GetOrdersUsecase _getOrdersUsecase;
  MyOrdersController(this._getOrdersUsecase);

  RxList<Orders> orderList = RxList.empty();
  late TabController tabController;
  int selectedIndex = 0;
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    _getOrders();
    super.onInit();
  }

  Future<void> _getOrders() async {
    try {
      orderList.value = await _getOrdersUsecase.execute() ?? [];
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.e(e.toString());
      }
    }
  }

  void getDetails(int index) {
    selectedIndex = index;
    Get.to(() => const OrderDetail());
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
