import 'package:auto_parts_hub/domain/core/entities/order_entities/order.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/order_models/order_model.dart';

abstract class OrdersRepository {
  Future<void> submitOrder(OrdersModel order);
  Future<List<Orders>?> getOrders();
}
