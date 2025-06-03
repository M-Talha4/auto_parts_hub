abstract class CreditCardEntity {
  final String _id;
  final String _name;
  final String _cardNo;
  final String _cardType;
  final String _expDate;
  final String _cvvCode;

  CreditCardEntity({
    required String id,
    required String name,
    required String cardNo,
    required String cardType,
    required String expDate,
    required String cvvCode,
  })  : _id = id,
        _name = name,
        _cardNo = cardNo,
        _cardType = cardType,
        _expDate = expDate,
        _cvvCode = cvvCode;

  String get id => _id;
  String get name => _name;
  String get cardNo => _cardNo;
  String get cardType => _cardType;
  String get expDate => _expDate;
  String get cvvCode => _cvvCode;
}
