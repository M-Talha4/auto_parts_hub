import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show QuerySnapshot;

abstract class ChatRepository {
  Stream<QuerySnapshot> getMessages(String otherId);
  Future<void> sendMessages(String otherId, String message);
  Future<List<UserModel>?> getUserAdminList(bool isAdmin);
}
