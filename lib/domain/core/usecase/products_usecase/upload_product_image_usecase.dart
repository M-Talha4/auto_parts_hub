import 'dart:io';
import 'package:auto_parts_hub/domain/core/interfaces/product_interdace/products_repository.dart';

class UploadProductImageUsecase {
  final ProductsRepository _productsRepository;
  UploadProductImageUsecase(this._productsRepository);

  Future<String?> execute(File file) {
    return _productsRepository.uploadImage(file);
  }
}
