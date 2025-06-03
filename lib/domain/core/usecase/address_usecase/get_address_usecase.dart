import '/domain/core/entities/address_entities/address_entity.dart';
import '/domain/core/interfaces/address_interface/address_repository.dart';

class GetAddressUsecase {
  final AddressRepository _addressRepository;
  GetAddressUsecase(this._addressRepository);

  Future<List<AddressEntity>?> execute() {
    return _addressRepository.getAddress();
  }
}
