import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/manage_users.controller.dart';

class ManageUsersScreen extends GetView<ManageUsersController> {
  const ManageUsersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManageUsersScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManageUsersScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
