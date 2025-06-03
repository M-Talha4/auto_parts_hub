import '/domain/core/entities/cart_entities/cart_entity.dart';
import '/infrastructure/dal/models/cart_models/cart_model.dart';

abstract class CartRepository {
  Future<String?> addToCart(CartModel cartItem);
  Future<List<CartEntity>?> getCartItems();
  Future<void> updateCart(String itemId, int count);
  Future<void> deleteCartItem(String itemId);
}
