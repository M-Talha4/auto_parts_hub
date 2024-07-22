import 'package:auto_parts_hub/domain/core/entities/address_entities/address.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/address_models/address_model.dart';

abstract class AddressRepository {
  Future<List<Address>?> getAddress();
  Future<void> addAddress(AddressModel address);
  Future<void> deleteAddress(String id);
}
