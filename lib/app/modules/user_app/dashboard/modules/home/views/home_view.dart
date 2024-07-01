import '/consts/const.dart';
import '/widgets/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controllers/home_controller.dart';
import '/consts/app_color.dart';
import '/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    Get.put(HomeController());
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.03),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                width: width * 0.88,
                child: CustomTextFormField(
                  controller: controller.searchController,
                  bordercolor: AppColor.primaryLight,
                  hint: searchPartsText,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColor.grey,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              CarouselSlider.builder(
                itemCount: controller.carouselImages.length,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    controller.currentIndex.value = index;
                  },
                  height: height * 0.25,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIndex) => Container(
                  width: width * 0.8,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: AppColor.amber,
                    borderRadius: BorderRadius.circular(width * 0.03),
                    image: DecorationImage(
                        image: AssetImage(controller.carouselImages[index]),
                        fit: BoxFit.fill),
                  ),
                  child: Container(
                    width: width,
                    height: height * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.primaryLight,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(width * 0.03))),
                    child: CustomText(
                      text: controller.carouselTitles[index],
                      color: AppColor.white,
                      fontSize: height * 0.035,
                      fontWeight: FontWeight.w500,
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
            ]),
          ),
        ),
      ),
    );
  }
}
