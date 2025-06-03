import '/domain/core/interfaces/address_interface/address_repository.dart';

class DeleteAddressUsecase {
  final AddressRepository _addressRepository;
  DeleteAddressUsecase(this._addressRepository);

  Future<void> execute(String id) {
    return _addressRepository.deleteAddress(id);
  }
}
