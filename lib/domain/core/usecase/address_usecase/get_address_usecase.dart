import 'package:auto_parts_hub/domain/core/entities/address_entities/address.dart';
import 'package:auto_parts_hub/domain/core/interfaces/address_interface/address_repository.dart';

class GetAddressUsecase {
  final AddressRepository _addressRepository;
  GetAddressUsecase(this._addressRepository);

  Future<List<Address>?> execute() {
    return _addressRepository.getAddress();
  }
}
