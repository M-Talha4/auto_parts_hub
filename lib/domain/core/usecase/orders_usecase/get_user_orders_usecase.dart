import 'package:auto_parts_hub/domain/core/entities/order_entities/order.dart';
import 'package:auto_parts_hub/domain/core/interfaces/orders_interface/orders_repository.dart';

class GetUserOrdersUsecase {
  final OrdersRepository _ordersRepository;
  GetUserOrdersUsecase(this._ordersRepository);

  Future<List<Orders>?> execute() {
    return _ordersRepository.getUserOrders();
  }
}
