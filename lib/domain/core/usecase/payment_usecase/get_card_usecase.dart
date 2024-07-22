import 'package:auto_parts_hub/domain/core/entities/credit_card_entities/credit_card.dart';
import 'package:auto_parts_hub/domain/core/interfaces/payment_interface/payment_repository.dart';

class GetCardUsecase {
  final PaymentRepository _paymentRepository;
  GetCardUsecase(this._paymentRepository);

  Future<List<CreditCard>?> execute() {
    return _paymentRepository.getCard();
  }
}
