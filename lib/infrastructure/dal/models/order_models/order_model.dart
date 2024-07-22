import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:auto_parts_hub/domain/core/entities/order_entities/order.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/cart_models/cart_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/address_models/address_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/credit_card_models/credit_card_model.dart';

class OrdersModel extends Orders {
  OrdersModel({
    super.orderId,
    super.customerId,
    super.customerEmail,
    super.orderStatus,
    super.orderPrice,
    super.cartItems,
    super.paymentDetails,
    super.shippingAddress,
  });

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'customerId': customerId,
      'customerEmail': customerEmail,
      'orderStatus': orderStatus,
      'orderPrice': orderPrice,
      'cartItems': cartItems?.map((x) => x.toMap()).toList(),
      'paymentDetails': paymentDetails?.toMap(),
      'shippingAddress': shippingAddress?.toMap(),
    };
  }

  factory OrdersModel.fromMap(Map<String, dynamic> map) {
    return OrdersModel(
      orderId: map['orderId'] != null ? map['orderId'] as String : null,
      customerId:
          map['customerId'] != null ? map['customerId'] as String : null,
      customerEmail:
          map['customerEmail'] != null ? map['customerEmail'] as String : null,
      orderStatus:
          map['orderStatus'] != null ? map['orderStatus'] as String : null,
      orderPrice: map['orderPrice'] != null ? map['orderPrice'] as int : null,
      cartItems: map['cartItems'] != null
          ? List<CartModel>.from(
              (map['cartItems'] as List<dynamic>).map<CartModel>(
                (x) => CartModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      paymentDetails: map['paymentDetails'] != null
          ? CreditCardModel.fromMap(
              map['paymentDetails'] as Map<String, dynamic>)
          : null,
      shippingAddress: map['shippingAddress'] != null
          ? AddressModel.fromMap(map['shippingAddress'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdersModel.fromJson(String source) =>
      OrdersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrdersModel(orderId: $orderId, customerId: $customerId,customerEmail: $customerEmail, orderStatus: $orderStatus, orderPrice: $orderPrice, cartItems: $cartItems, paymentDetails: $paymentDetails, shippingAddress: $shippingAddress)';
  }

  @override
  bool operator ==(covariant Orders other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId &&
        other.customerId == customerId &&
        other.customerEmail == customerEmail &&
        other.orderStatus == orderStatus &&
        other.orderPrice == orderPrice &&
        listEquals(other.cartItems, cartItems) &&
        other.paymentDetails == paymentDetails &&
        other.shippingAddress == shippingAddress;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        customerId.hashCode ^
        customerEmail.hashCode ^
        orderStatus.hashCode ^
        orderPrice.hashCode ^
        cartItems.hashCode ^
        paymentDetails.hashCode ^
        shippingAddress.hashCode;
  }
}
