import '/domain/core/entities/order_entities/order_entity.dart';
import '/infrastructure/dal/models/order_models/order_model.dart';

abstract class OrdersRepository {
  Future<void> submitOrder(OrdersModel order);
  Future<List<OrdersEntity>?> getUserOrders();
  Future<List<OrdersEntity>?> getAllOrders();
  Future<void> changeOrderStatus(String orderId, String orderStatus);
}
