import 'package:auto_parts_hub/domain/core/interfaces/profile_interface/profile_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/profile_usecae/update_profile_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/profile_usecae/upload_image_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/profile_dao/profile_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firebase_storage_service.dart';
import 'package:get/get.dart';
import '../../../../../presentation/dashboard/profile/controllers/profile.controller.dart';

class ProfileControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseStorageService());
    Get.lazyPut<ProfileRepository>(() => ProfileDao(
        Get.find<FirebaseStorageService>(), Get.find<AuthServices>()));
    Get.lazyPut<UploadImageUsecase>(
        () => UploadImageUsecase(Get.find<ProfileRepository>()));
    Get.lazyPut<UpdateProfileUsecase>(
        () => UpdateProfileUsecase(Get.find<ProfileRepository>()));
    Get.lazyPut<ProfileController>(() => ProfileController(
        Get.find<UploadImageUsecase>(), Get.find<UpdateProfileUsecase>()));
  }
}
