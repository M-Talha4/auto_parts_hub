import 'package:auto_parts_hub/domain/core/interfaces/chat_interface/chat_repository.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show QuerySnapshot;

class ChatDao implements ChatRepository {
  final ChatService _chatService;
  final AuthServices _authServices;
  ChatDao(this._chatService, this._authServices);

  @override
  Stream<QuerySnapshot> getMessages(String otherId) {
    try {
      return _chatService.getMessages(otherId).orderBy('timestamp').snapshots();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendMessages(String otherId, String message) async {
    try {
      await _chatService.sendMessage(otherId: otherId, message: message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserModel>?> getUserAdminList(bool isAdmin) async {
    try {
      return isAdmin
          ? _authServices.getUsersCollection()
          : _authServices.getAdminsCollection();
    } catch (e) {
      rethrow;
    }
  }
}
