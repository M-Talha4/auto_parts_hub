import '/domain/const/static_data.dart';
import '/domain/core/usecase/chat_usecase.dart/get_chat_list_usecase.dart';
import '/domain/exceptions/app_exception.dart';
import '/domain/utils/custom_snackbar.dart';
import '/domain/utils/logger.dart';
import '/infrastructure/dal/models/user_models/user_model.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  final GetChatListUsecase _getChatListUsecase;
  ChatListController(this._getChatListUsecase);

  RxList<UserModel> chatList = RxList.empty();

  @override
  void onInit() {
    _getChatList();
    super.onInit();
  }

  Future<void> _getChatList() async {
    try {
      chatList.value =
          await _getChatListUsecase.execute(StaticData.isAdmin) ?? [];
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      }
      Logger.error(message: e);
    }
  }
}
