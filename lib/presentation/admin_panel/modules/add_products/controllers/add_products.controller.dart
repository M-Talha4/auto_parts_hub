import 'dart:io';
import '/domain/core/usecase/products_usecase/add_product_usecase.dart';
import '/domain/core/usecase/products_usecase/update_product_usecase.dart';
import '/domain/core/usecase/products_usecase/upload_product_image_usecase.dart';
import '/domain/exceptions/app_exception.dart';
import '/domain/utils/custom_snackbar.dart';
import '/domain/utils/loading_mixin.dart';
import '/domain/utils/logger.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/dal/models/product_models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductsController extends GetxController with LoadingMixin {
  final UploadProductImageUsecase _uploadImageUsecase;
  final AddProductUsecase _addProductUsecase;
  final UpdateProductUsecase _updateProductUsecase;
  AddProductsController(this._uploadImageUsecase, this._addProductUsecase,
      this._updateProductUsecase);

  ProductModel? product = Get.arguments;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  File? image;
  final ImagePicker _imagePicker = ImagePicker();

  RxString selectedCategory = LocaleKeys.admin_panel_select_category_text.obs;
  RxBool isPicked = false.obs;
  RxString imagePath = ''.obs;
  bool isEditing = false;

  List<String> categoryList = [
    LocaleKeys.admin_panel_select_category_text,
    LocaleKeys.home_engines_text,
    LocaleKeys.home_headlights_text,
    LocaleKeys.home_rims_text,
    LocaleKeys.home_tires_text
  ];
  final List<String> _categoryDataList = [
    'engines',
    'headlights',
    'rims',
    'tires'
  ];
  @override
  void onInit() {
    isEditing = product != null;
    isEditing ? _setValues() : null;
    super.onInit();
  }

  void _setValues() {
    nameController.text = product!.productName;
    brandController.text = product!.productBrand;
    vehicleController.text = product!.productVehicle;
    priceController.text = product!.productPrice.toString();
    descController.text = product!.productDescription;
    selectedCategory.value =
        categoryList[_categoryDataList.indexOf(product!.productCategory) + 1];
  }

  void pickFromCamera() async {
    isPicked.value = false;
    XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      isPicked.value = true;
    }
  }

  void pickFromGallery() async {
    isPicked.value = false;
    XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      isPicked.value = true;
    }
  }

  void addOrEdit() {
    if (formKey.currentState!.validate() &&
        selectedCategory.value != categoryList[0]) {
      (image != null || isEditing)
          ? _uploadImage()
          : showSnackbar(
              message: LocaleKeys.exception_please_choose_an_image_first.tr,
              isError: true);
    } else if (selectedCategory.value == categoryList[0]) {
      showSnackbar(
          message: LocaleKeys.exception_please_choose_a_category.tr,
          isError: true);
    }
  }

  Future<void> _uploadImage() async {
    try {
      setLoading(true);
      if (isEditing) {
        updateProduct(product!.productImage);
      } else {
        String idUrl = await _uploadImageUsecase.execute(image!) ?? '';
        List<String> list = idUrl.split('_');
        addProduct(list[0].toString(), list[1].toString());
      }
      _clearFields();
      setLoading(false);
      showSnackbar(
          message: isEditing
              ? LocaleKeys.admin_panel_product_updated_successfully_text.tr
              : LocaleKeys.admin_panel_product_added_successfully_text.tr);
      Get.back();
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.error(message: e.toString());
      }
    }
    setLoading(false);
  }

  Future<void> addProduct(String id, String imageUrl) async {
    try {
      product = ProductModel(
          productId: id,
          productBrand: brandController.text.trim().toString(),
          productCategory: _categoryDataList[
              categoryList.indexOf(selectedCategory.value) - 1],
          productDescription: descController.text.trim().toString(),
          productImage: imageUrl,
          productName: nameController.text.trim().toString(),
          productPrice: int.parse(priceController.text.trim()),
          productVehicle: vehicleController.text.trim().toString());
      await _addProductUsecase.execute(product!);
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.error(message: e.toString());
      }
    }
  }

  Future<void> updateProduct(String imageUrl) async {
    try {
      product = ProductModel(
          productId: product!.productId,
          productBrand: brandController.text.trim().toString(),
          productCategory: _categoryDataList[
              categoryList.indexOf(selectedCategory.value) - 1],
          productDescription: descController.text.trim().toString(),
          productImage: imageUrl,
          productName: nameController.text.trim().toString(),
          productPrice: int.parse(priceController.text.trim()),
          productVehicle: vehicleController.text.trim().toString());
      await _updateProductUsecase.execute(product!);
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.error(message: e.toString());
      }
    }
  }

  void _clearFields() {
    selectedCategory.value = categoryList.first;
    nameController.clear();
    brandController.clear();
    vehicleController.clear();
    priceController.clear();
    descController.clear();
  }
}
