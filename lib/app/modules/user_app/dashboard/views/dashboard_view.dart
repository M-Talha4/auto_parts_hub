import '/app/routes/app_pages.dart';

import '../../dashboard/modules/dashboard_drawer/views/dashboard_drawer_view.dart';
import '../../dashboard/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
              child: const Icon(Icons.notifications_active_outlined),
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.MY_CART),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ],
        ),
        drawer: const DashboardDrawerView(),
        body: const HomeView());
  }
}
