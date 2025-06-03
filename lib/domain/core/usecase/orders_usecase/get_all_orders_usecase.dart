import '/domain/core/entities/order_entities/order_entity.dart';
import '/domain/core/interfaces/orders_interface/orders_repository.dart';

class GetAllOrdersUsecase {
  final OrdersRepository _ordersRepository;
  GetAllOrdersUsecase(this._ordersRepository);

  Future<List<OrdersEntity>?> execute() {
    return _ordersRepository.getAllOrders();
  }
}
