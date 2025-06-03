import '/infrastructure/dal/models/cart_models/cart_model.dart';
import '/infrastructure/dal/models/address_models/address_model.dart';
import '/infrastructure/dal/models/credit_card_models/credit_card_model.dart';

abstract class OrdersEntity {
  final String? _orderId;
  final String? _customerId;
  final String? _customerEmail;
  final String? _orderStatus;
  final int? _orderPrice;
  final List<CartModel>? _cartItems;
  final CreditCardModel? _paymentDetails;
  final AddressModel? _shippingAddress;

  OrdersEntity({
    String? orderId,
    String? customerId,
    String? customerEmail,
    String? orderStatus,
    int? orderPrice,
    List<CartModel>? cartItems,
    CreditCardModel? paymentDetails,
    AddressModel? shippingAddress,
  })  : _orderId = orderId,
        _customerId = customerId,
        _customerEmail = customerEmail,
        _orderStatus = orderStatus,
        _orderPrice = orderPrice,
        _cartItems = cartItems,
        _paymentDetails = paymentDetails,
        _shippingAddress = shippingAddress;

  String? get orderId => _orderId;
  String? get customerId => _customerId;
  String? get customerEmail => _customerEmail;
  String? get orderStatus => _orderStatus;
  int? get orderPrice => _orderPrice;
  List<CartModel>? get cartItems => _cartItems;
  CreditCardModel? get paymentDetails => _paymentDetails;
  AddressModel? get shippingAddress => _shippingAddress;
}
