import 'package:get/get.dart';

mixin LoadingMixin on GetxController {
  var isLoading = false.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }
}
