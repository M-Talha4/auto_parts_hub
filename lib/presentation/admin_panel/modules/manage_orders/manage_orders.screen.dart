import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/manage_orders.controller.dart';

class ManageOrdersScreen extends GetView<ManageOrdersController> {
  const ManageOrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManageOrdersScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManageOrdersScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
