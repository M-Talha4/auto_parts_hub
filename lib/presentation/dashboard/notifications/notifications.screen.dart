import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/notifications.controller.dart';

class NotificationsScreen extends GetView<NotificationsController> {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationsScreen'),
      ),
      body: const Center(
        child: Text(
          'NotificationsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
