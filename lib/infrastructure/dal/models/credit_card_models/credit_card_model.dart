import 'dart:convert';
import '../../../../domain/core/entities/credit_card_entities/credit_card.dart';

class CreditCardModel extends CreditCard {
  CreditCardModel({
    required super.id,
    required super.name,
    required super.cardNo,
    required super.cardType,
    required super.expDate,
    required super.cvvCode,
  });

  CreditCardModel copyWith({
    String? id,
    String? name,
    String? cardNo,
    String? cardType,
    String? expDate,
    String? cvvCode,
  }) {
    return CreditCardModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cardNo: cardNo ?? this.cardNo,
      cardType: cardType ?? this.cardType,
      expDate: expDate ?? this.expDate,
      cvvCode: cvvCode ?? this.cvvCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cardNo': cardNo,
      'cardType': cardType,
      'expDate': expDate,
      'cvvCode': cvvCode,
    };
  }

  factory CreditCardModel.fromMap(Map<String, dynamic> map) {
    return CreditCardModel(
      id: map['id'] as String,
      name: map['name'] as String,
      cardNo: map['cardNo'] as String,
      cardType: map['cardType'] as String,
      expDate: map['expDate'] as String,
      cvvCode: map['cvvCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditCardModel.fromJson(String source) =>
      CreditCardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardModel(id: $id, name: $name, cardNo: $cardNo, cardType: $cardType, expDate: $expDate, cvvCode: $cvvCode)';
  }

  @override
  bool operator ==(covariant CreditCardModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.cardNo == cardNo &&
        other.cardType == cardType &&
        other.expDate == expDate &&
        other.cvvCode == cvvCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        cardNo.hashCode ^
        cardType.hashCode ^
        expDate.hashCode ^
        cvvCode.hashCode;
  }
}
