import '/domain/core/interfaces/cart_interface/cart_repository.dart';

class UpdateCartUsecase {
  final CartRepository _cartRepository;
  UpdateCartUsecase(this._cartRepository);

  Future<void> execute(String itemId, int count) {
    return _cartRepository.updateCart(itemId, count);
  }
}
