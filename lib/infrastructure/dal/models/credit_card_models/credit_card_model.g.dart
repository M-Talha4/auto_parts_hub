// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCardModel _$CreditCardModelFromJson(Map<String, dynamic> json) =>
    CreditCardModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      cardNo: json['cardNo'] as String? ?? '',
      cardType: json['cardType'] as String? ?? '',
      expDate: json['expDate'] as String? ?? '',
      cvvCode: json['cvvCode'] as String? ?? '',
    );

Map<String, dynamic> _$CreditCardModelToJson(CreditCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cardNo': instance.cardNo,
      'cardType': instance.cardType,
      'expDate': instance.expDate,
      'cvvCode': instance.cvvCode,
    };
