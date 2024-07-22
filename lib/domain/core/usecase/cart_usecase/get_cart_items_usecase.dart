import 'package:auto_parts_hub/domain/core/entities/cart_entities/cart.dart';
import 'package:auto_parts_hub/domain/core/interfaces/cart_interface/cart_repository.dart';

class GetCartItemsUsecase {
  final CartRepository _cartRepository;
  GetCartItemsUsecase(this._cartRepository);

  Future<List<Cart>?> execute() {
    return _cartRepository.getCartItems();
  }
}
