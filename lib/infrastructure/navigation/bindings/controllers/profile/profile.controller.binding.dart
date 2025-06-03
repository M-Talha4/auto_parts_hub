import '/domain/core/interfaces/profile_interface/profile_repository.dart';
import '/domain/core/usecase/profile_usecae/update_profile_usecase.dart';
import '/domain/core/usecase/profile_usecae/upload_profile_image_usecase.dart';
import '/infrastructure/dal/daos/profile_dao/profile_dao.dart';
import '/infrastructure/dal/services/firebase_services/auth_services.dart';
import '/infrastructure/dal/services/firebase_services/firebase_storage_service.dart';
import 'package:get/get.dart';
import '../../../../../presentation/dashboard/profile/controllers/profile.controller.dart';
import '../../../../dal/services/firebase_services/notification_services.dart';

class ProfileControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseStorageService());
    Get.lazyPut<ProfileRepository>(() => ProfileDao(
        Get.find<FirebaseStorageService>(),
        Get.find<AuthServices>(),
        Get.find<NotificationServices>()));
    Get.lazyPut<UploadProfileImageUsecase>(
        () => UploadProfileImageUsecase(Get.find<ProfileRepository>()));
    Get.lazyPut<UpdateProfileUsecase>(
        () => UpdateProfileUsecase(Get.find<ProfileRepository>()));
    Get.lazyPut<ProfileController>(() => ProfileController(
        Get.find<UploadProfileImageUsecase>(),
        Get.find<UpdateProfileUsecase>()));
  }
}
