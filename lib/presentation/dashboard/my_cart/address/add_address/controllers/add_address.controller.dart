import 'package:auto_parts_hub/domain/core/usecase/address_usecase/add_address_usecase.dart';
import 'package:auto_parts_hub/domain/utils/loading_mixin.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/address_models/address_model.dart';
import 'package:auto_parts_hub/presentation/dashboard/my_cart/address/controllers/address.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController with LoadingMixin {
  final AddAddressUsecase _addAddressUsecase;
  final AddressController _addressScreenController;
  AddAddressController(this._addAddressUsecase, this._addressScreenController);

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addAddress() async {
    if (formKey.currentState!.validate()) {
      setLoading(true);
      AddressModel address = AddressModel(
          id: DateTime.now().toString(),
          name: nameController.text.toString(),
          address: addressController.text.toString(),
          city: cityController.text.toString(),
          postalCode: postalCodeController.text.toString());
      await _addAddressUsecase.execute(address);
      _addressScreenController.addressList.add(address);
      clearFields();
      Get.back(closeOverlays: true);
    }
    setLoading(false);
  }

  clearFields() {
    nameController.clear();
    addressController.clear();
    cityController.clear();
    postalCodeController.clear();
  }
}
