import '/domain/utils/context_extensions.dart';

import '/generated/locales.generated.dart';
import '/infrastructure/navigation/routes.dart';
import '/presentation/dashboard/home/drawer/home_drawer.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/custom_text_field.dart';
import '/presentation/widgets/price_rich_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: controller.homeScaffoldKey,
      drawer: const HomeDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Obx(
              () => Container(
                alignment: Alignment.center,
                height: 40,
                width: width,
                margin: EdgeInsets.only(top: 12),
                child: controller.isSearching.value == true
                    ? SizedBox(
                        width: width * 0.9,
                        child: CustomTextFormField(
                          controller: controller.searchController,
                          hint: LocaleKeys.home_search_parts_text.tr,
                          prefixIcon: Icon(
                            Icons.search,
                            color: context.colorScheme.outlineVariant,
                          ),
                          suffixIcon: InkWell(
                            onTap: () => controller.onSearchOff(),
                            child: const Icon(
                              Icons.close_rounded,
                            ),
                          ),
                          onChanged: (value) => controller.query.value = value,
                        ),
                      )
                    : Row(
                        children: [
                          IconButton(
                              onPressed: () => controller
                                  .homeScaffoldKey.currentState
                                  ?.openDrawer(),
                              icon: const Icon(
                                Icons.menu_rounded,
                              )),
                          const Spacer(),
                          IconButton(
                              onPressed: () =>
                                  controller.isSearching.value = true,
                              icon: const Icon(
                                Icons.search_rounded,
                              )),
                          InkWell(
                              onTap: () => Get.toNamed(Routes.MY_CART),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                              )),
                          IconButton(
                              onPressed: () => controller.notificationDialog(),
                              // Get.toNamed(Routes.NOTIFICATIONS),
                              icon: const Icon(
                                Icons.notifications_none_outlined,
                              )),
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Obx(
              () => !controller.isSearching.value
                  ? Column(children: [
                      CarouselSlider.builder(
                        itemCount: controller.carouselImages.length,
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            controller.currentIndex.value = index;
                          },
                          height: 170,
                          autoPlay: true,
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (context, index, realIndex) => InkWell(
                          onTap: () => Get.toNamed(Routes.CATEGORY, arguments: {
                            'title': controller.carouselTitles[index],
                            'titleEng': controller.carouselTitlesEnglish[index],
                            'imagePath': controller.carouselImages[index],
                            'products': controller.productList,
                          }),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            child: Container(
                              width: width * 0.8,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: context.colorScheme.primary,
                                image: DecorationImage(
                                    image: AssetImage(
                                        controller.carouselImages[index]),
                                    fit: BoxFit.fill),
                              ),
                              child: Container(
                                width: width,
                                height: width * 0.1,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: context.colorScheme.secondary,
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
                            children: List.generate(
                                controller.carouselImages.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 18,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color:
                                          controller.currentIndex.value == index
                                              ? context.colorScheme.onSurface
                                              : context.colorScheme.outline,
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                              );
                            }),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: LocaleKeys.home_popular_text.tr,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            InkWell(
                                onTap: () => Get.toNamed(Routes.ALL_CATEGORIES,
                                        arguments: {
                                          'titles': controller.carouselTitles,
                                          'imagePaths':
                                              controller.carouselImages,
                                          'products': controller.productList,
                                        }),
                                child: CustomText(
                                  text: LocaleKeys.home_see_all_text.tr,
                                  fontSize: 16,
                                  color: context.colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ])
                  : const SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Obx(
                () => GridView.builder(
                  itemCount: controller.finalList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 185),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL,
                        arguments: controller.finalList[index]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: context.colorScheme.shadow,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      controller.finalList[index].productImage),
                                  fit: BoxFit.cover)),
                        ),
                        CustomText(
                          text: controller.finalList[index].productName,
                          maxlines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          color: context.colorScheme.primary,
                        ),
                        PriceText(
                            price: controller.finalList[index].productPrice,
                            currency: LocaleKeys.my_cart_pkr_text.tr)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
