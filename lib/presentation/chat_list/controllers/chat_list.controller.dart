import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/core/usecase/chat_usecase.dart/get_chat_list_usecase.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';
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
      Logger.e(e);
    }
  }
}
