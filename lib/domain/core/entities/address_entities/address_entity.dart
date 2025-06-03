abstract class AddressEntity {
  final String _id;
  final String _name;
  final String _address;
  final String _city;
  final String _postalCode;

  AddressEntity({
    required String id,
    required String name,
    required String address,
    required String city,
    required String postalCode,
  })  : _id = id,
        _name = name,
        _address = address,
        _city = city,
        _postalCode = postalCode;

  String get id => _id;
  String get name => _name;
  String get address => _address;
  String get city => _city;
  String get postalCode => _postalCode;
}
