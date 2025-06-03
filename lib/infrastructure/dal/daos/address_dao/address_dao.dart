import 'dart:async';
import 'dart:io';
import '/domain/core/interfaces/address_interface/address_repository.dart';
import '/domain/exceptions/network_exception.dart';
import '/domain/exceptions/time_out_exception.dart';
import '/infrastructure/dal/models/address_models/address_model.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';

class AddressDao implements AddressRepository {
  final FireStoreServices _fireStoreServices;
  AddressDao(this._fireStoreServices);

  @override
  Future<List<AddressModel>> getAddress() async {
    try {
      return await _fireStoreServices.getAddressList();
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addAddress(AddressModel address) async {
    try {
      await _fireStoreServices.addAddress(address);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAddress(String id) async {
    try {
      await _fireStoreServices.deleteAddress(id);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
