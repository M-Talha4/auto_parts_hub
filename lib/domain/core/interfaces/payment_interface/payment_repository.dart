import 'package:auto_parts_hub/domain/core/entities/credit_card_entities/credit_card.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/credit_card_models/credit_card_model.dart';

abstract class PaymentRepository {
  Future<List<CreditCard>?> getCard();
  Future<void> addCard(CreditCardModel creditCard);
  Future<void> deleteCard(String id);
}
