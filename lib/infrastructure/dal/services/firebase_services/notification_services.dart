// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '/domain/const/const.dart';

import '../../../../domain/notifications/firebase_push_notifications/firebase_push_notifications.dart';
import '../../../../domain/utils/logger.dart';
import '../../models/notification_models/notification_model.dart';
import 'remote_config_services.dart';

class NotificationServices extends GetxService {
  final RemoteConfigServices _remoteConfigServices;
  final FirebasePushNotifications _firebasePushNotifications;
  NotificationServices(
      this._remoteConfigServices, this._firebasePushNotifications);

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection(firebaseUsersCollection);
  CollectionReference adminCollection =
      FirebaseFirestore.instance.collection(firebaseAdminCollection);

  String fcmToken = '';

// ----------------------------reset password ----------------------------------
  Future<String> getFCMToken() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      if (Platform.isAndroid) {
        fcmToken = await messaging.getToken() ?? '';
        return fcmToken;
      }
      if (Platform.isIOS) {
        fcmToken = await messaging.getAPNSToken() ?? '';
        return fcmToken;
      }
      return '';
    } catch (e) {
      Logger.error(message: e);
      return '';
    }
  }

// ---------------------------- Update Token ----------------------------------
  Future<void> updateToken(String userId) async {
    try {
      await userCollection.doc(userId).update({'fcmToken': fcmToken});
    } catch (e) {
      rethrow;
    }
  }

// ---------------------------- Update Token ----------------------------------
  Future<void> removeToken(String userId) async {
    try {
      await userCollection.doc(userId).update({'fcmToken': ''});
    } catch (e) {
      rethrow;
    }
  }

// ---------------------------- Update Token ----------------------------------
  Future<void> sendNotification(NotificationModel notification) async {
    try {
      await _firebasePushNotifications.sendNotification(
          _remoteConfigServices.remoteConfigModel.serviceAccountKey,
          notification);
    } catch (e) {
      rethrow;
    }
  }
}
