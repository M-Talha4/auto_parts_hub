import '/domain/core/entities/credit_card_entities/credit_card_entity.dart';
import '/infrastructure/dal/models/credit_card_models/credit_card_model.dart';

abstract class PaymentRepository {
  Future<List<CreditCardEntity>?> getCard();
  Future<void> addCard(CreditCardModel creditCard);
  Future<void> deleteCard(String id);
}
