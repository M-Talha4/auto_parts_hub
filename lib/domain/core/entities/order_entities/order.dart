import 'package:auto_parts_hub/infrastructure/dal/models/cart_models/cart_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/address_models/address_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/credit_card_models/credit_card_model.dart';

class Orders {
  String? orderId;
  String? customerId;
  String? customerEmail;
  String? orderStatus;
  int? orderPrice;
  List<CartModel>? cartItems;
  CreditCardModel? paymentDetails;
  AddressModel? shippingAddress;

  Orders({
    this.orderId,
    this.customerId,
    this.customerEmail,
    this.orderStatus,
    this.orderPrice,
    this.cartItems,
    this.paymentDetails,
    this.shippingAddress,
  });
}
