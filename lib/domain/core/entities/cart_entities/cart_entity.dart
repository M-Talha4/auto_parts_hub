abstract class CartEntity {
  final String _itemId;
  final String _itemName;
  final int _itemCount;
  final String _itemImage;
  final int _itemPrice;

  CartEntity({
    required String itemId,
    required String itemName,
    required int itemCount,
    required String itemImage,
    required int itemPrice,
  })  : _itemId = itemId,
        _itemName = itemName,
        _itemCount = itemCount,
        _itemImage = itemImage,
        _itemPrice = itemPrice;

  String get itemId => _itemId;
  String get itemName => _itemName;
  int get itemCount => _itemCount;
  String get itemImage => _itemImage;
  int get itemPrice => _itemPrice;
}
