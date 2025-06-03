import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/core/entities/credit_card_entities/credit_card_entity.dart';

part 'credit_card_model.g.dart';

@JsonSerializable()
class CreditCardModel extends CreditCardEntity {
  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @override
  @JsonKey(name: 'cardNo', defaultValue: '')
  final String cardNo;

  @override
  @JsonKey(name: 'cardType', defaultValue: '')
  final String cardType;

  @override
  @JsonKey(name: 'expDate', defaultValue: '')
  final String expDate;

  @override
  @JsonKey(name: 'cvvCode', defaultValue: '')
  final String cvvCode;

  CreditCardModel({
    required this.id,
    required this.name,
    required this.cardNo,
    required this.cardType,
    required this.expDate,
    required this.cvvCode,
  }) : super(
          id: id,
          name: name,
          cardNo: cardNo,
          cardType: cardType,
          expDate: expDate,
          cvvCode: cvvCode,
        );

  // CopyWith method
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

  // Equals method to compare two instances
  bool equals(CreditCardModel other) {
    return other.id == id &&
        other.name == name &&
        other.cardNo == cardNo &&
        other.cardType == cardType &&
        other.expDate == expDate &&
        other.cvvCode == cvvCode;
  }

  // Factory method for json_serializable
  factory CreditCardModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCardModelFromJson(json);

  // toJson method for json_serializable
  Map<String, dynamic> toJson() => _$CreditCardModelToJson(this);
}
