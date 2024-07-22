import 'package:auto_parts_hub/domain/core/interfaces/payment_interface/payment_repository.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/credit_card_models/credit_card_model.dart';

class AddCardUsecase {
  final PaymentRepository _paymentRepository;
  AddCardUsecase(this._paymentRepository);

  Future<void> execute(CreditCardModel card) {
    return _paymentRepository.addCard(card);
  }
}
