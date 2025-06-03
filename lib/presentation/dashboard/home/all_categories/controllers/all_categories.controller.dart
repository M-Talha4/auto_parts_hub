import '/domain/core/entities/product_entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategoriesController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt currentIndex = 0.obs;
  List<String> carouselImages = [];
  List<String> carouselTitles = [];
  List<ProductEntity> products = [];
  @override
  onInit() {
    carouselTitles = Get.arguments['titles'];
    carouselImages = Get.arguments['imagePaths'];
    products = Get.arguments['products'];
    super.onInit();
  }

  List<String> names = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace',
    'Heidi',
    'Ivan',
    'Judy',
    'Karl',
    'Liam',
    'Mallory',
    'Niaj',
    'Olivia',
    'Peggy',
    'Quinn',
    'Rudy',
    'Sybil',
    'Trent',
    'Uma',
    'Victor',
    'Walter',
    'Xavier',
    'Yvonne',
    'Zara'
  ];
}
