import 'package:auto_parts_hub/domain/core/interfaces/chat_interface/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show QuerySnapshot;

class GetMessageUsecase {
  final ChatRepository _chatRepository;
  GetMessageUsecase(this._chatRepository);

  Stream<QuerySnapshot> execute(String otherId) {
    return _chatRepository.getMessages(otherId);
  }
}
