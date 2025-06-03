abstract class ProductEntity {
  final String _productId;
  final String _productBrand;
  final String _productCategory;
  final String _productDescription;
  final String _productImage;
  final String _productName;
  final int _productPrice;
  final String _productVehicle;

  ProductEntity({
    required String productId,
    required String productBrand,
    required String productCategory,
    required String productDescription,
    required String productImage,
    required String productName,
    required int productPrice,
    required String productVehicle,
  })  : _productId = productId,
        _productBrand = productBrand,
        _productCategory = productCategory,
        _productDescription = productDescription,
        _productImage = productImage,
        _productName = productName,
        _productPrice = productPrice,
        _productVehicle = productVehicle;

  String get productId => _productId;
  String get productBrand => _productBrand;
  String get productCategory => _productCategory;
  String get productDescription => _productDescription;
  String get productImage => _productImage;
  String get productName => _productName;
  int get productPrice => _productPrice;
  String get productVehicle => _productVehicle;
}
