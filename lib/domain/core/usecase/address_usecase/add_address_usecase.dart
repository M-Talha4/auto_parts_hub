import 'package:auto_parts_hub/domain/core/interfaces/address_interface/address_repository.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/address_models/address_model.dart';

class AddAddressUsecase {
  final AddressRepository _addressRepository;
  AddAddressUsecase(this._addressRepository);

  Future<void> execute(AddressModel address) {
    return _addressRepository.addAddress(address);
  }
}
