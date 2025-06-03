import '/domain/core/interfaces/address_interface/address_repository.dart';
import '/domain/core/usecase/address_usecase/add_address_usecase.dart';
import '/infrastructure/dal/daos/address_dao/address_dao.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';
import '/presentation/dashboard/my_cart/address/controllers/address.controller.dart';
import 'package:get/get.dart';

import '../../../../../../presentation/dashboard/my_cart/address/add_address/controllers/add_address.controller.dart';

class AddAddressControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressRepository>(
        () => AddressDao(Get.find<FireStoreServices>()));
    Get.lazyPut<AddAddressUsecase>(
        () => AddAddressUsecase(Get.find<AddressRepository>()));
    Get.lazyPut<AddAddressController>(
      () => AddAddressController(
          Get.find<AddAddressUsecase>(), Get.find<AddressController>()),
    );
  }
}
