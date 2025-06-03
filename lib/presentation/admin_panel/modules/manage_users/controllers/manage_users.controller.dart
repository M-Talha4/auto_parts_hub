import '/domain/core/entities/user_entities/user_entity.dart';
import '/domain/core/usecase/users_usecase/delete_user_usecase.dart';
import '/domain/core/usecase/users_usecase/get_users_usecase.dart';
import '/domain/exceptions/app_exception.dart';
import '/domain/utils/custom_snackbar.dart';
import '/domain/utils/logger.dart';
import '/generated/locales.generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageUsersController extends GetxController {
  final GetUsersUsecase _getUsersUsecase;
  final DeleteUserUsecase _deleteUserUsecase;
  ManageUsersController(this._getUsersUsecase, this._deleteUserUsecase);

  RxList<UserEntity> usersList = RxList.empty();

  @override
  onInit() {
    getUsers();
    super.onInit();
  }

  Future<void> getUsers() async {
    try {
      usersList.value = await _getUsersUsecase.execute() ?? [];
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      }
      Logger.error(message: e);
    }
  }

  Future<void> confirmDeletion(BuildContext context, String userId) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LocaleKeys.dialog_delete_text.tr),
          content: Text(LocaleKeys
              .dialog_are_you_sure_you_want_to_delete_this_item_text.tr),
          actions: <Widget>[
            TextButton(
              child: Text(LocaleKeys.dialog_no_text.tr),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(LocaleKeys.dialog_yes_text.tr),
              onPressed: () async {
                await deleteUser(userId);
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _deleteUserUsecase.execute(userId);
      usersList.removeWhere((user) => user.userId == userId);
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      }
      Logger.error(message: e);
    }
  }
}
