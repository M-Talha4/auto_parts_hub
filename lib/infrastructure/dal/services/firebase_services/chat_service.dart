import 'dart:async';
import '../../../../domain/const/static_data.dart';
import '/domain/const/const.dart';
import '/domain/core/entities/user_entities/user_entity.dart';
import '/infrastructure/dal/models/chat_model/message_model.dart';
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
    String chatRoomId = chatId.join('-');

    try {
      chatCollection
          .doc(chatRoomId)
          .collection(firebaseChatSubCollectionMessage)
          .add(messageModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  CollectionReference getMessages(String otherId) {
    String senderId = StaticData.userId;
    try {
      List<String> chatId = [senderId, otherId]..sort();
      String chatRoomId = chatId.join('-');
      return chatCollection
          .doc(chatRoomId)
          .collection(firebaseChatSubCollectionMessage);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteChat(String userId, List<UserEntity> admins) async {
    try {
      for (var admin in admins) {
        List<String> chatId = [userId, admin.userId]..sort();
        String chatRoomId = chatId.join('-');
        await _deleteChat(chatRoomId);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _deleteChat(String chatRoomId) async {
    try {
      QuerySnapshot querySnapshot = await chatCollection
          .doc(chatRoomId)
          .collection(firebaseChatSubCollectionMessage)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          doc.reference.delete();
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
