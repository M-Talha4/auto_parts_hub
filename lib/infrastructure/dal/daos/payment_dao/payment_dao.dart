import 'dart:async';
import 'dart:io';
import '/domain/core/entities/credit_card_entities/credit_card_entity.dart';
import '/domain/core/interfaces/payment_interface/payment_repository.dart';
import '/domain/exceptions/network_exception.dart';
import '/domain/exceptions/time_out_exception.dart';
import '/infrastructure/dal/models/credit_card_models/credit_card_model.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';

class PaymentDao implements PaymentRepository {
  final FireStoreServices _fireStoreServices;
  PaymentDao(this._fireStoreServices);

  @override
  Future<List<CreditCardEntity>> getCard() async {
    try {
      return await _fireStoreServices.getCardList();
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addCard(CreditCardModel creditCard) async {
    try {
      await _fireStoreServices.addCard(creditCard);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCard(String id) async {
    try {
      await _fireStoreServices.deleteCard(id);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
