import 'package:auto_parts_hub/domain/core/entities/order_entities/order.dart';
import 'package:auto_parts_hub/domain/core/interfaces/orders_interface/orders_repository.dart';

class GetAllOrdersUsecase {
  final OrdersRepository _ordersRepository;
  GetAllOrdersUsecase(this._ordersRepository);

  Future<List<Orders>?> execute() {
    return _ordersRepository.getAllOrders();
  }
}
