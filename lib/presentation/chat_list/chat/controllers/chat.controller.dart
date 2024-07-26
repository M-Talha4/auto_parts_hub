import 'package:auto_parts_hub/domain/core/usecase/chat_usecase.dart/get_message_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/chat_usecase.dart/send_message_usecase.dart';
import 'package:auto_parts_hub/domain/utils/loading_mixin.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/chat_model/message_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart'
    show QuerySnapshot, Timestamp;
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:flutter/material.dart'
    show AsyncSnapshot, TextEditingController;
import 'package:intl/intl.dart' show DateFormat;
import 'package:get/get.dart';

class ChatController extends GetxController with LoadingMixin {
  final GetMessageUsecase _getMessageUsecase;
  final SendMessageUsecase _sendMessageUsecase;
  ChatController(this._getMessageUsecase, this._sendMessageUsecase);

  UserModel user = Get.arguments;

  TextEditingController chatController = TextEditingController();

  Stream<QuerySnapshot> getMessages() {
    try {
      return _getMessageUsecase.execute(user.userId);
    } catch (e) {
      Logger.e(e);
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
      } catch (e) {
        Logger.e(e);
      }
      setLoading(false);
    }
  }

  List<MessageModel> getList(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return snapshot.data!.docs
        .map((message) =>
            MessageModel.fromMap(message.data() as Map<String, dynamic>))
        .toList();
  }

  String convertTime(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    DateFormat format = DateFormat('h: mm aa');
    return format.format(date);
  }
}
