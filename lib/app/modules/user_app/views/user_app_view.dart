import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_app_controller.dart';

class UserAppView extends GetView<UserAppController> {
  const UserAppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserAppView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UserAppView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
