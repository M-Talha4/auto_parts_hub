import 'package:auto_parts_hub/domain/core/interfaces/cart_interface/cart_repository.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/cart_models/cart_model.dart';

class AddToCartUsecase {
  final CartRepository _cartRepository;
  AddToCartUsecase(this._cartRepository);

  Future<String?> execute(CartModel cartItem) {
    return _cartRepository.addToCart(cartItem);
  }
}
