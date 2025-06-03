import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../../../domain/core/entities/order_entities/order_entity.dart';
import '../address_models/address_model.dart';
import '../cart_models/cart_model.dart';
import '../credit_card_models/credit_card_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrdersModel extends OrdersEntity {
  @override
  @JsonKey(name: 'orderId')
  final String? orderId;

  @override
  @JsonKey(name: 'customerId')
  final String? customerId;

  @override
  @JsonKey(name: 'customerEmail')
  final String? customerEmail;

  @override
  @JsonKey(name: 'orderStatus')
  final String? orderStatus;

  @override
  @JsonKey(name: 'orderPrice')
  final int? orderPrice;

  @override
  @JsonKey(name: 'cartItems')
  final List<CartModel>? cartItems;

  @override
  @JsonKey(name: 'paymentDetails')
  final CreditCardModel? paymentDetails;

  @override
  @JsonKey(name: 'shippingAddress')
  final AddressModel? shippingAddress;

  OrdersModel({
    this.orderId,
    this.customerId,
    this.customerEmail,
    this.orderStatus,
    this.orderPrice,
    this.cartItems,
    this.paymentDetails,
    this.shippingAddress,
  }) : super(
          orderId: orderId,
          customerId: customerId,
          customerEmail: customerEmail,
          orderStatus: orderStatus,
          orderPrice: orderPrice,
          cartItems: cartItems,
          paymentDetails: paymentDetails,
          shippingAddress: shippingAddress,
        );

  // CopyWith method
  OrdersModel copyWith({
    String? orderId,
    String? customerId,
    String? customerEmail,
    String? orderStatus,
    int? orderPrice,
    List<CartModel>? cartItems,
    CreditCardModel? paymentDetails,
    AddressModel? shippingAddress,
  }) {
    return OrdersModel(
      orderId: orderId ?? this.orderId,
      customerId: customerId ?? this.customerId,
      customerEmail: customerEmail ?? this.customerEmail,
      orderStatus: orderStatus ?? this.orderStatus,
      orderPrice: orderPrice ?? this.orderPrice,
      cartItems: cartItems ?? this.cartItems,
      paymentDetails: paymentDetails ?? this.paymentDetails,
      shippingAddress: shippingAddress ?? this.shippingAddress,
    );
  }

  // Equals method
  bool equals(Object other) {
    return other is OrdersModel &&
        other.orderId == orderId &&
        other.customerId == customerId &&
        other.customerEmail == customerEmail &&
        other.orderStatus == orderStatus &&
        other.orderPrice == orderPrice &&
        listEquals(other.cartItems, cartItems) &&
        other.paymentDetails == paymentDetails &&
        other.shippingAddress == shippingAddress;
  }

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersModelToJson(this);
}
