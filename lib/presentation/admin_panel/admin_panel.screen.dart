import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/admin_panel.controller.dart';

class AdminPanelScreen extends GetView<AdminPanelController> {
  const AdminPanelScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminPanelScreen'),
        centerTitle: true,
      ),
      body: InkWell(
        onTap: () => controller.logout(),
        child: const Center(
          child: Text(
            'AdminPanelScreen is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
