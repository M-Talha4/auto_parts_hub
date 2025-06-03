import '/domain/utils/context_extensions.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controllers/all_categories.controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/navigation/routes.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/price_rich_text.dart';

class AllCategoriesScreen extends GetView<AllCategoriesController> {
  const AllCategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: LocaleKeys.my_cart_products_text.tr,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.keyboard_arrow_left,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: controller.carouselImages.length,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    controller.currentIndex.value = index;
                  },
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIndex) => InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: width * 0.8,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        image: DecorationImage(
                            image: AssetImage(controller.carouselImages[index]),
                            fit: BoxFit.fill),
                      ),
                      child: Container(
                        width: width,
                        height: width * 0.1,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary,
                        ),
                        child: CustomText(
                          text: controller.carouselTitles[index].tr,
                          color: context.colorScheme.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(() => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.carouselImages.length,
                        (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 18,
                          height: 4,
                          decoration: BoxDecoration(
                              color: controller.currentIndex.value == index
                                  ? Colors.black
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      );
                    }),
                  )),
              Padding(
                padding: EdgeInsets.all(width * 0.06),
                child: GridView.builder(
                  itemCount: controller.products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 185),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL,
                        arguments: controller.products[index]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: context.colorScheme.onPrimaryContainer,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      controller.products[index].productImage),
                                  fit: BoxFit.cover)),
                        ),
                        CustomText(
                          text: controller.products[index].productName,
                          maxlines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          color: context.colorScheme.primary,
                        ),
                        PriceText(
                            price: controller.products[index].productPrice,
                            currency: LocaleKeys.my_cart_pkr_text.tr)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
