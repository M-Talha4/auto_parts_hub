import 'package:auto_parts_hub/domain/core/entities/cart_entities/cart.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/cart_models/cart_model.dart';

abstract class CartRepository {
  Future<String?> addToCart(CartModel cartItem);
  Future<List<Cart>?> getCartItems();
  Future<void> updateCart(String itemId, int count);
  Future<void> deleteCartItem(String itemId);
}
