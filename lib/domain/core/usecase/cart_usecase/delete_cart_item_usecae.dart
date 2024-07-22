import 'package:auto_parts_hub/domain/core/interfaces/cart_interface/cart_repository.dart';

class DeleteCartItemUsecae {
  final CartRepository _cartRepository;
  DeleteCartItemUsecae(this._cartRepository);

  Future<void> execute(String itemId) {
    return _cartRepository.deleteCartItem(itemId);
  }
}
