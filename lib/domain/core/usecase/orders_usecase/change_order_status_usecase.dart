import '/domain/core/interfaces/orders_interface/orders_repository.dart';

class ChangeOrderStatusUsecase {
  final OrdersRepository _ordersRepository;
  ChangeOrderStatusUsecase(this._ordersRepository);

  Future<void> execute(String orderId, String orderStatus) {
    return _ordersRepository.changeOrderStatus(orderId, orderStatus);
  }
}
