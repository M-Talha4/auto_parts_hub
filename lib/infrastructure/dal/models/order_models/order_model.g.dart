// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      orderId: json['orderId'] as String?,
      customerId: json['customerId'] as String?,
      customerEmail: json['customerEmail'] as String?,
      orderStatus: json['orderStatus'] as String?,
      orderPrice: (json['orderPrice'] as num?)?.toInt(),
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentDetails: json['paymentDetails'] == null
          ? null
          : CreditCardModel.fromJson(
              json['paymentDetails'] as Map<String, dynamic>),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : AddressModel.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'customerId': instance.customerId,
      'customerEmail': instance.customerEmail,
      'orderStatus': instance.orderStatus,
      'orderPrice': instance.orderPrice,
      'cartItems': instance.cartItems,
      'paymentDetails': instance.paymentDetails,
      'shippingAddress': instance.shippingAddress,
    };
