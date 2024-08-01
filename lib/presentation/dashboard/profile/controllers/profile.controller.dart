import 'dart:io';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/core/usecase/profile_usecae/update_profile_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/profile_usecae/upload_profile_image_usecase.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/utils/loading_mixin.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController with LoadingMixin {
  final UploadProfileImageUsecase _uploadProfileImageUsecase;
  final UpdateProfileUsecase _updateProfileUsecase;
  ProfileController(
      this._uploadProfileImageUsecase, this._updateProfileUsecase);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? image;
  final ImagePicker _imagePicker = ImagePicker();
  RxString imagePath = ''.obs;
  RxBool isNetworkImage = false.obs;
  RxBool isPicked = false.obs;
  RxBool isEnabled = false.obs;
  @override
  void onInit() {
    _initialValue();
    super.onInit();
  }

  void _initialValue() {
    nameController.text = StaticData.name;
    phoneController.text = StaticData.phoneNo;
    imagePath.value = StaticData.profileImage;
    isNetworkImage.value = imagePath.value != '';
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

  Future<void> onSave() async {
    setLoading(true);
    if (formKey.currentState!.validate()) {
      if (StaticData.name != nameController.text.trim().toString() ||
          StaticData.phoneNo != phoneController.text.trim().toString() ||
          image != null) {
        _uploadImage();
      }
    }
  }

  Future<void> _uploadImage() async {
    try {
      StaticData.profileImage =
          await _uploadProfileImageUsecase.execute(image!) ?? '';
      _updateUser();
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.e(e.toString());
      }
    }
    setLoading(false);
  }

  Future<void> _updateUser() async {
    try {
      UserModel user = UserModel(
          userId: StaticData.userId,
          name: nameController.text.trim().toString(),
          email: StaticData.email,
          isAdmin: StaticData.isAdmin,
          language: StaticData.language,
          phoneNo: phoneController.text.trim().toString(),
          profileImage: StaticData.profileImage);

      await _updateProfileUsecase.execute(user);
      isEnabled.value = false;
      showSnackbar(message: LocaleKeys.profile_updated.tr);
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.e(e.toString());
      }
    }
    setLoading(false);
  }
}
