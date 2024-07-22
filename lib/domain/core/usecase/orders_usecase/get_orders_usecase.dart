import 'package:auto_parts_hub/domain/core/entities/order_entities/order.dart';
import 'package:auto_parts_hub/domain/core/interfaces/orders_interface/orders_repository.dart';

class GetOrdersUsecase {
  final OrdersRepository _ordersRepository;
  GetOrdersUsecase(this._ordersRepository);

  Future<List<Orders>?> execute() {
    return _ordersRepository.getOrders();
  }
}
