import '/domain/core/entities/order_entities/order_entity.dart';
import '/domain/core/interfaces/orders_interface/orders_repository.dart';

class GetUserOrdersUsecase {
  final OrdersRepository _ordersRepository;
  GetUserOrdersUsecase(this._ordersRepository);

  Future<List<OrdersEntity>?> execute(String userId) {
    return _ordersRepository.getUserOrders(userId);
  }
}
