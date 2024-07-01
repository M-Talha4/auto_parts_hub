import 'package:flutter/widgets.dart';

import '../../../../../../../consts/assets_paths.dart';
import '/consts/app_color.dart';
import '/consts/const.dart';
import '/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_cart_controller.dart';

class MyCartView extends GetView<MyCartController> {
  const MyCartView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: myCartText,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColor.white,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 26,
            )),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(width * 0.06),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: height * 0.07,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 1, color: AppColor.amber)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: productsText,
                      fontSize: height * 0.035,
                      fontWeight: FontWeight.w400,
                    ),
                    // Icon(Icons.s)
                    const VerticalDivider(
                      width: 1,
                    ),
                    CustomText(
                      text: '${controller.totalProducts.value} $itemsText',
                      fontSize: height * 0.035,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ListView.separated(
                  itemCount: 3,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(
                        height: height * 0.03,
                        thickness: 1,
                        color: AppColor.primaryLight,
                      ),
                  itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: width * 0.3,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    ImagePath.appLogo,
                                  ),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          SizedBox(
                            width: width * 0.4,
                            child: const Column(
                              children: [
                                CustomText(
                                    text: tiresText +
                                        tiresText +
                                        tiresText +
                                        tiresText +
                                        tiresText +
                                        tiresText +
                                        tiresText)
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              InkWell(onTap: () {}, child: Icon(Icons.add)),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColor.amber)),
                                child: CustomText(
                                  text: controller.totalProducts.toString(),
                                ),
                              )
                            ],
                          )
                        ],
                      ))
            ]),
          ),
        ),
      ),
    );
  }
}
