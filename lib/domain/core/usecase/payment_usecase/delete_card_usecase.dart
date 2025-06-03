import '/domain/core/interfaces/payment_interface/payment_repository.dart';

class DeleteCardUsecase {
  final PaymentRepository _paymentRepository;
  DeleteCardUsecase(this._paymentRepository);

  Future<void> execute(String id) {
    return _paymentRepository.deleteCard(id);
  }
}
