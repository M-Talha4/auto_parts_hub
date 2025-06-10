import 'dart:io';
import '../../../../infrastructure/dal/services/firebase_services/user_services.dart';
import '/domain/core/usecase/profile_usecae/update_profile_usecase.dart';
import '/domain/core/usecase/profile_usecae/upload_profile_image_usecase.dart';
import '/domain/exceptions/app_exception.dart';
import '/domain/utils/custom_snackbar.dart';
import '/domain/utils/loading_mixin.dart';
import '/domain/utils/logger.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/dal/models/user_models/user_model.dart';
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
    nameController.text = Get.find<UserServices>().user.value.name;
    phoneController.text = Get.find<UserServices>().user.value.phoneNo;
    imagePath.value = Get.find<UserServices>().user.value.profileImage;
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
      if (image != null) {
        await _uploadImage();
      } else if (Get.find<UserServices>().user.value.name !=
              nameController.text.trim().toString() ||
          Get.find<UserServices>().user.value.phoneNo !=
              phoneController.text.trim().toString()) {
        await _updateUser();
      }
    }
    setLoading(false);
  }

  Future<void> _uploadImage() async {
    try {
      imagePath.value = await _uploadProfileImageUsecase.execute(image!) ?? '';
      _updateUser();
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.error(message: e.toString());
      }
    }
  }

  Future<void> _updateUser() async {
    try {
      UserModel user = UserModel(
        userId: Get.find<UserServices>().user.value.userId,
        name: nameController.text.trim().toString(),
        email: Get.find<UserServices>().user.value.email,
        isAdmin: Get.find<UserServices>().user.value.isAdmin,
        language: Get.find<UserServices>().user.value.language,
        phoneNo: phoneController.text.trim().toString(),
        profileImage: imagePath.value,
        fcmToken: '',
      );

      await _updateProfileUsecase.execute(user);
      isEnabled.value = false;
      showSnackbar(message: LocaleKeys.profile_updated.tr);
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.error(message: e.toString());
      }
    }
  }
}
