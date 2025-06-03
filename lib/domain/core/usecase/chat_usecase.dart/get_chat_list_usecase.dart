import '/domain/core/interfaces/chat_interface/chat_repository.dart';
import '/infrastructure/dal/models/user_models/user_model.dart';

class GetChatListUsecase {
  final ChatRepository _chatRepository;
  GetChatListUsecase(this._chatRepository);

  Future<List<UserModel>?> execute(bool isAdmin) {
    return _chatRepository.getUserAdminList(isAdmin);
  }
}
