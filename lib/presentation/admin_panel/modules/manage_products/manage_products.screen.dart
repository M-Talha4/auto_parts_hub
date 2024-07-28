import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/manage_products.controller.dart';

class ManageProductsScreen extends GetView<ManageProductsController> {
  const ManageProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManageProductsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManageProductsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
