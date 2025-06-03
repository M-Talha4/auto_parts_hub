import '/domain/core/interfaces/address_interface/address_repository.dart';
import '/infrastructure/dal/models/address_models/address_model.dart';

class AddAddressUsecase {
  final AddressRepository _addressRepository;
  AddAddressUsecase(this._addressRepository);

  Future<void> execute(AddressModel address) {
    return _addressRepository.addAddress(address);
  }
}
