import '/domain/core/entities/credit_card_entities/credit_card_entity.dart';
import '/domain/core/interfaces/payment_interface/payment_repository.dart';

class GetCardUsecase {
  final PaymentRepository _paymentRepository;
  GetCardUsecase(this._paymentRepository);

  Future<List<CreditCardEntity>?> execute() {
    return _paymentRepository.getCard();
  }
}
