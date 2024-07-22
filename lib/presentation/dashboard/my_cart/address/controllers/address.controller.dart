import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/domain/core/entities/address_entities/address.dart';
import 'package:auto_parts_hub/domain/core/usecase/address_usecase/delete_address_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/address_usecase/get_address_usecase.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/address_models/address_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/order_models/order_model.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final GetAddressUsecase _getAddressUsecase;
  final DeleteAddressUsecase _deleteAddressUsecase;
  AddressController(this._getAddressUsecase, this._deleteAddressUsecase);

  RxInt selectedIndex = (0).obs;
  RxList<Address> addressList = RxList.empty();

  @override
  onInit() async {
    _getAddressList();
    super.onInit();
  }

  void _getAddressList() async {
    try {
      addressList.value = await _getAddressUsecase.execute() ?? [];
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.e(e.toString());
      }
    }
  }

  Future<void> confirmDeletion(
      BuildContext context, String id, int index) async {
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
                addressList.removeAt(index);
                await _deleteAddressUsecase.execute(id);
                if (index <= selectedIndex.value && selectedIndex.value != 0) {
                  selectedIndex.value -= 1;
                }
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  TextStyle textStyle(int index) {
    return selectedIndex.value == index
        ? TextStyle(
            color: colorScheme(Get.context).surface,
            fontWeight: FontWeight.w600)
        : TextStyle(
            color: colorScheme(Get.context).onSurface,
            fontWeight: FontWeight.w600);
  }

  TextStyle textStyle2(int index) {
    return selectedIndex.value == index
        ? TextStyle(
            color: colorScheme(Get.context).onSurface,
            fontWeight: FontWeight.w600)
        : TextStyle(
            color: colorScheme(Get.context).outlineVariant,
            fontWeight: FontWeight.w600);
  }

  onTapContinue() {
    if (addressList.isNotEmpty) {
      if (selectedIndex.value != -1) {
        int amount = Get.arguments['amount'];
        OrdersModel orders = Get.arguments['order'];
        orders.shippingAddress =
            addressList[selectedIndex.value] as AddressModel;
        Get.toNamed(Routes.PAYMENTS,
            arguments: {'order': orders, 'amount': amount});
      } else {
        showSnackbar(
            message: LocaleKeys.address_no_address_selected_text.tr,
            isError: true);
      }
    } else {
      showSnackbar(
          message: LocaleKeys.address_add_an_address_first_text.tr,
          isError: true);
    }
  }
}
