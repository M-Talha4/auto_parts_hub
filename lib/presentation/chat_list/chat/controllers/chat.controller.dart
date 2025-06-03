import '/domain/const/static_data.dart';
import '/domain/core/usecase/chat_usecase.dart/get_message_usecase.dart';
import '/domain/core/usecase/chat_usecase.dart/send_message_usecase.dart';
import '/domain/utils/loading_mixin.dart';
import '/infrastructure/dal/models/chat_model/message_model.dart';
import '/infrastructure/dal/models/user_models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart'
    show QuerySnapshot, Timestamp;
import '/domain/utils/logger.dart';
import 'package:flutter/material.dart'
    show AsyncSnapshot, TextEditingController;
import 'package:intl/intl.dart' show DateFormat;
import 'package:get/get.dart';

import '../../../../domain/core/usecase/notification_usecase/send_notification_usecase.dart';
import '../../../../infrastructure/dal/models/notification_models/notification_model.dart';

class ChatController extends GetxController with LoadingMixin {
  final GetMessageUsecase _getMessageUsecase;
  final SendMessageUsecase _sendMessageUsecase;
  final SendNotificationUsecase _sendNotificationUsecase;
  ChatController(this._getMessageUsecase, this._sendMessageUsecase,
      this._sendNotificationUsecase);

  UserModel user = Get.arguments;

  TextEditingController chatController = TextEditingController();

  Stream<QuerySnapshot> getMessages() {
    try {
      return _getMessageUsecase.execute(user.userId);
    } catch (e) {
      Logger.error(message: e);
      return const Stream.empty();
    }
  }

  Future<void> sendMessages() async {
    if (chatController.text.trim().isNotEmpty) {
      String message = chatController.text.trim();
      setLoading(true);
      try {
        await _sendMessageUsecase.execute(
            otherId: user.userId, message: message);
        chatController.clear();
        _sendNotification(message);
      } catch (e) {
        Logger.error(message: e);
      }
      setLoading(false);
    }
  }

  List<MessageModel> getList(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return snapshot.data!.docs
        .map((message) =>
            MessageModel.fromJson(message.data() as Map<String, dynamic>))
        .toList();
  }

  String convertTime(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    DateFormat format = DateFormat('h: mm aa');
    return format.format(date);
  }

  Future<void> _sendNotification(String message) async {
    try {
      if (user.fcmToken.isEmpty) return;
      NotificationModel notificationModel = NotificationModel(
          fcmToken: user.fcmToken,
          notification: NotificationBodyModel(
              title: 'Message From ${StaticData.name}', body: message));
      await _sendNotificationUsecase.execute(notificationModel);
    } catch (e) {
      Logger.error(message: e);
    }
  }
}
