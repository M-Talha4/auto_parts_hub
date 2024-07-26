import 'package:auto_parts_hub/domain/core/interfaces/chat_interface/chat_repository.dart';

class SendMessageUsecase {
  final ChatRepository _chatRepository;
  SendMessageUsecase(this._chatRepository);

  Future<void> execute({required String otherId, required String message}) {
    return _chatRepository.sendMessages(otherId, message);
  }
}
