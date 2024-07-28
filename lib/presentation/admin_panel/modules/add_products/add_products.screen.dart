import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/add_products.controller.dart';

class AddProductsScreen extends GetView<AddProductsController> {
  const AddProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProductsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddProductsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
