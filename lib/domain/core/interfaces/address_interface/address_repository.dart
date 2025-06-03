import '/domain/core/entities/address_entities/address_entity.dart';
import '/infrastructure/dal/models/address_models/address_model.dart';

abstract class AddressRepository {
  Future<List<AddressEntity>?> getAddress();
  Future<void> addAddress(AddressModel address);
  Future<void> deleteAddress(String id);
}
