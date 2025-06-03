import '/domain/core/interfaces/address_interface/address_repository.dart';
import '/domain/core/usecase/address_usecase/delete_address_usecase.dart';
import '/domain/core/usecase/address_usecase/get_address_usecase.dart';
import '/infrastructure/dal/daos/address_dao/address_dao.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';

import '../../../../../../presentation/dashboard/my_cart/address/controllers/address.controller.dart';

class AddressControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressRepository>(
        () => AddressDao(Get.find<FireStoreServices>()));
    Get.lazyPut<GetAddressUsecase>(
        () => GetAddressUsecase(Get.find<AddressRepository>()));
    Get.lazyPut<DeleteAddressUsecase>(
        () => DeleteAddressUsecase(Get.find<AddressRepository>()));

    Get.lazyPut<AddressController>(
      () => AddressController(
          Get.find<GetAddressUsecase>(), Get.find<DeleteAddressUsecase>()),
    );
  }
}
