import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_panel_controller.dart';

class AdminPanelView extends GetView<AdminPanelController> {
  const AdminPanelView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminPanelView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminPanelView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
