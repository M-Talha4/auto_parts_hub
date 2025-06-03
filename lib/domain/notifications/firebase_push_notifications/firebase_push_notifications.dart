import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../infrastructure/dal/models/notification_models/notification_model.dart';
import '../../utils/logger.dart';

class FirebasePushNotifications {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> requestPermission() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      provisional: true,
      criticalAlert: true,
      sound: true,
    );

    /// Granted - Permission
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      Logger.info(message: 'Permisson Granted');

      /// Granted  Provisonal  (Access)  Permission
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      Logger.info(message: 'User granted provisoanl permissions');

      /// Permission Denied
    } else {
      Logger.info(message: 'User declined or has not accepted permission');
    }
  }

  /// Initializing [Flutter] - [Local] - [Notifications] - [Plugin]
  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iOSInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    /// Foreground Notification Handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Logger.info(
          message:
              '--------------------------------------------------\nReceived message while in foreground:\n ${message.notification?.title}\n${message.notification?.body}\n--------------------------------------------------');

      _showNotification(message);
    });

    /// Background - Notification Handling in [main.dart]

    /// OnTap - Notification Handling
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Logger.info(message: 'Message Tapped! ${message.notification?.title}');
      _showNotification(message);
    });
  }

  // Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  // //  print('Handling a background message: ${message.messageId}');
  //   _showNotification(message);
  // }

  /// Show [Notification]s on Device
  Future<void> _showNotification(RemoteMessage message) async {
    int notificationId = generateRandomId();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      playSound: true, // Enable sound
      // sound: RawResourceAndroidNotificationSound('notification_sound'), // Uncomment for custom sound
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      notificationId,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  /// Enable [AutoInit] - [Notifications] for Platforms
  Future<void> enableAutoInit() async {
    if (Platform.isAndroid) {
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
    }
  }

  /// Generate [Access] - [Token] for Notification request
  static Future<String> getAccessToken(String serviceAccountKey) async {
    final Map<String, dynamic> serviceToken = jsonDecode(serviceAccountKey);

    List<String> scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging'
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceToken), scopes);

      auth.AccessCredentials credentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
              auth.ServiceAccountCredentials.fromJson(serviceToken),
              scopes,
              client);

      client.close();
      Logger.info(
          message:
              'Access token fetched successfully: ${credentials.accessToken.data}');
      return credentials.accessToken.data;
    } catch (e) {
      Logger.error(message: 'Error fetching access token: $e');
      throw Exception('Failed to fetch access token');
    }
  }

  /// [Send] - [Notification]
  Future<void> sendNotification(
      String serviceAccountKey, NotificationModel notification) async {
    Logger.info(message: 'Preparing to send notification...');
    final String serverAccessTokenKey = await getAccessToken(serviceAccountKey);
    Logger.info(message: 'Server access token: $serverAccessTokenKey');

    String endpointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/goshop-21a8f/messages:send';

    try {
      final http.Response response = await http.post(
        Uri.parse(endpointFirebaseCloudMessaging),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $serverAccessTokenKey'
        },
        body: jsonEncode({
          'message': notification.toJson(),
        }),
      );

      if (response.statusCode == 200) {
        Logger.info(
            message: 'Notification sent successfully: ${response.body}');
      } else {
        Logger.warning(message: 'Error sending notification: ${response.body}');
        throw Exception('Failed to send notification');
      }
    } catch (e) {
      Logger.error(
          message: 'Exception occurred while sending notification: $e');
      throw Exception('Failed to send notification');
    }
  }

  /// [Send] - [Notification] to [Topic]
  Future<void> sendNotificationToTopic(
      {required String serviceAccountKey,
      required String notificationTopic,
      String? title,
      String? body}) async {
    Logger.info(message: 'Preparing to send notification...');
    final String serverAccessTokenKey = await getAccessToken(serviceAccountKey);
    Logger.info(message: 'Server access token: $serverAccessTokenKey');

    const url =
        'https://fcm.googleapis.com/v1/projects/goshop-21a8f/messages:send';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverAccessTokenKey',
    };

    final data = {
      "message": {
        "topic": notificationTopic,
        "notification": {"title": title ?? "Notification", "body": body ?? ""},
        "data": {"key1": "value1", "key2": "value2"}
      }
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        Logger.info(
            message: 'Notification sent successfully: ${response.body}');
      } else {
        Logger.warning(message: 'Error sending notification: ${response.body}');
        throw Exception('Failed to send notification');
      }
    } catch (e) {
      Logger.error(
          message: 'Exception occurred while sending notification: $e');
      throw Exception('Failed to send notification');
    }
  }
}

int generateRandomId() {
  final Random random = Random();
  return random.nextInt(1000000);
}
