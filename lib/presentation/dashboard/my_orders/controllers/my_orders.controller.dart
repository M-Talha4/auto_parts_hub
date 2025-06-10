import '../../../../infrastructure/dal/services/firebase_services/user_services.dart';
import '/domain/core/entities/order_entities/order_entity.dart';
import '/domain/core/usecase/orders_usecase/get_user_orders_usecase.dart';
import '/domain/exceptions/app_exception.dart';
import '/domain/utils/custom_snackbar.dart';
import '/domain/utils/logger.dart';
import '/presentation/dashboard/my_orders/module/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrdersController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GetUserOrdersUsecase _getUserOrdersUsecase;
  MyOrdersController(this._getUserOrdersUsecase);

  RxList<OrdersEntity> orderList = RxList.empty();
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
      orderList.value = await _getUserOrdersUsecase
              .execute(Get.find<UserServices>().user.value.userId) ??
          [];
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.error(message: e.toString());
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
