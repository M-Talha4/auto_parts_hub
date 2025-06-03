import 'package:auto_parts_hub/domain/utils/context_extensions.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controllers/category.controller.dart';
import '/generated/locales.generated.dart';
import '/presentation/widgets/custom_text.dart';
import '/infrastructure/navigation/routes.dart';
import '/presentation/widgets/price_rich_text.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: GetBuilder(
            init: CategoryController(),
            builder: (_) {
              return NestedScrollView(
                  controller: controller.scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        expandedHeight: width * 0.65,
                        floating: false,
                        pinned: true,
                        backgroundColor: controller.color,
                        leading: InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            size: width * 0.09,
                            color: controller.iconColor,
                          ),
                        ),
                        flexibleSpace: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(30)),
                          child: FlexibleSpaceBar(
                            titlePadding:
                                EdgeInsets.only(bottom: controller.padding),
                            title: Container(
                                width: width,
                                height: width * 0.1,
                                padding: EdgeInsets.only(
                                    left: controller
                                                .scrollController.hasClients &&
                                            controller.scrollController.position
                                                    .pixels >
                                                150
                                        ? 70
                                        : 0),
                                alignment:
                                    controller.scrollController.hasClients &&
                                            controller.scrollController.position
                                                    .pixels >
                                                150
                                        ? Alignment.centerLeft
                                        : Alignment.center,
                                decoration: BoxDecoration(
                                  color: controller.textBgColor,
                                ),
                                child: Text(controller.title.tr,
                                    style: TextStyle(
                                      color: controller.iconColor,
                                    ))),
                            background: Container(
                              decoration: BoxDecoration(
                                color: context.colorScheme.secondary,
                                borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(30)),
                                image: DecorationImage(
                                  image: AssetImage(controller.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: GridView.builder(
                      itemCount: controller.products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  color: context.colorScheme.shadow,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1),
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .products[index].productImage),
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
                  ));
            }));
  }
}
