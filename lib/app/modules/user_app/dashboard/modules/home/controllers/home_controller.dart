import '/consts/const.dart';

import '/consts/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt currentIndex = 0.obs;
  List<String> carouselImages = [
    ImagePath.catEnginesImage,
    ImagePath.catHeadlightsImage,
    ImagePath.catRimsImage,
    ImagePath.catTiresImage,
  ];
  List<String> carouselTitles = [
    enginesText,
    headlightsText,
    rimsText,
    tiresText
  ];
}
