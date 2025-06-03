import '/domain/core/entities/cart_entities/cart_entity.dart';
import '/domain/core/interfaces/cart_interface/cart_repository.dart';

class GetCartItemsUsecase {
  final CartRepository _cartRepository;
  GetCartItemsUsecase(this._cartRepository);

  Future<List<CartEntity>?> execute() {
    return _cartRepository.getCartItems();
  }
}
