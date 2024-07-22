import 'package:auto_parts_hub/domain/core/usecase/payment_usecase/add_card_usecase.dart';
import 'package:auto_parts_hub/domain/utils/loading_mixin.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/credit_card_models/credit_card_model.dart';
import 'package:auto_parts_hub/presentation/dashboard/my_cart/payments/controllers/payments.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardController extends GetxController with LoadingMixin {
  final AddCardUsecase _addCardUsecase;
  final PaymentsController _paymentsController;
  AddCardController(this._addCardUsecase, this._paymentsController);

  TextEditingController nameController = TextEditingController();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvCodeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString selectedCardType = LocaleKeys.payment_select_card_type_text.obs;
  RxList<String> dropdownMenuItems = [
    LocaleKeys.payment_select_card_type_text,
    LocaleKeys.payment_visa_text,
    LocaleKeys.payment_master_card_text,
  ].obs;

  Future<void> addCard() async {
    if (formKey.currentState!.validate()) {
      setLoading(true);
      CreditCardModel card = CreditCardModel(
          id: DateTime.now().toString(),
          name: nameController.text.toString(),
          cardNo: cardNoController.text.toString(),
          cardType: selectedCardType.value.toLowerCase(),
          expDate: expDateController.text.toString(),
          cvvCode: cvvCodeController.text.toString());
      await _addCardUsecase.execute(card);
      _paymentsController.cardList.add(card);
      clearFields();
      Get.back(closeOverlays: true);
    }
    setLoading(false);
  }

  clearFields() {
    selectedCardType.value = LocaleKeys.payment_select_card_type_text;
    nameController.clear();
    cardNoController.clear();
    expDateController.clear();
    cvvCodeController.clear();
  }
}
