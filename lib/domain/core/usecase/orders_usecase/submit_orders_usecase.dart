import 'package:auto_parts_hub/domain/core/interfaces/orders_interface/orders_repository.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/order_models/order_model.dart';

class SubmitOrdersUsecase {
  final OrdersRepository _ordersRepository;
  SubmitOrdersUsecase(this._ordersRepository);

  Future<void> execute(OrdersModel order) {
    return _ordersRepository.submitOrder(order);
  }
}
