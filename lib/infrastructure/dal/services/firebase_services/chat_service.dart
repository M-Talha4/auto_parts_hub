import 'dart:async';
import 'package:auto_parts_hub/domain/const/const.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/chat_model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatService extends GetxService {
  CollectionReference chatCollection =
      FirebaseFirestore.instance.collection(firebaseChatCollection);

  Future<void> sendMessage(
      {required String otherId, required String message}) async {
    String senderId = StaticData.userId;
    MessageModel messageModel = MessageModel(
        senderId: senderId,
        recieverId: otherId,
        message: message,
        messageSeen: false,
        timestamp: Timestamp.now());

    List<String> chatId = [senderId, otherId]..sort();
    String chatRoomid = chatId.join('-');

    try {
      chatCollection
          .doc(chatRoomid)
          .collection(firebaseChatSubCollectionMessage)
          .add(messageModel.toMap());
    } catch (e) {
      rethrow;
    }
  }

  CollectionReference getMessages(String otherId) {
    String senderId = StaticData.userId;
    try {
      List<String> chatId = [senderId, otherId]..sort();
      String chatRoomid = chatId.join('-');
      return chatCollection
          .doc(chatRoomid)
          .collection(firebaseChatSubCollectionMessage);
    } catch (e) {
      rethrow;
    }
  }
}
