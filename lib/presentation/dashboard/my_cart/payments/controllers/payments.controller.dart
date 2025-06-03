import '/domain/core/usecase/orders_usecase/submit_orders_usecase.dart';
import '/domain/core/usecase/payment_usecase/delete_card_usecase.dart';
import '/domain/core/usecase/payment_usecase/get_card_usecase.dart';
import '/domain/exceptions/app_exception.dart';
import '/domain/utils/custom_snackbar.dart';
import '/domain/utils/loading_mixin.dart';
import '/domain/utils/logger.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/dal/models/credit_card_models/credit_card_model.dart';
import '/infrastructure/dal/models/order_models/order_model.dart';
import '/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsController extends GetxController with LoadingMixin {
  final GetCardUsecase _getCardUsecase;
  final DeleteCardUsecase _deleteCardUsecase;
  final SubmitOrdersUsecase _submitOrdersUsecase;
  PaymentsController(
      this._getCardUsecase, this._deleteCardUsecase, this._submitOrdersUsecase);

  RxInt selectedIndex = (0).obs;
  OrdersModel order = Get.arguments['order'];
  int amount = Get.arguments['amount'];
  RxInt discount = 0.obs;
  RxInt totalAmount = 0.obs;
  RxBool showCVV = false.obs;
  RxList<CreditCardModel> cardList = RxList.empty();

  @override
  onInit() async {
    _getCardList();
    super.onInit();
  }

  void _getCardList() async {
    try {
      cardList.value =
          (await _getCardUsecase.execute() ?? []) as List<CreditCardModel>;
      totalAmount.value = order.orderPrice!;
      discount.value = amount - totalAmount.value;
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.error(message: e.toString());
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
                cardList.removeAt(index);
                await _deleteCardUsecase.execute(id);
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

  void onTapContinue() async {
    if (cardList.isNotEmpty) {
      if (selectedIndex.value != -1) {
        setLoading(true);
        order = order.copyWith(paymentDetails: cardList[selectedIndex.value]);
        try {
          await _submitOrdersUsecase.execute(order);
          setLoading(false);
          Get.toNamed(Routes.ORDER_PLACED);
        } catch (e) {
          if (e is AppException) {
            showSnackbar(message: e.message!, icon: e.icon, isError: true);
          } else {
            Logger.error(message: e.toString());
          }
        }
      } else {
        showSnackbar(
            message: LocaleKeys.payment_no_card_selected_text.tr,
            isError: true);
      }
    } else {
      showSnackbar(
          message: LocaleKeys.payment_add_a_card_first_text.tr, isError: true);
    }
    setLoading(false);
  }
}
