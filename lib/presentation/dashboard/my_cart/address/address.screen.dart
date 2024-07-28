import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:auto_parts_hub/infrastructure/theme/imports.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_button.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/address.controller.dart';

class AddressScreen extends GetView<AddressController> {
  const AddressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: LocaleKeys.address_address_text.tr,
        ),
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
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Obx(
              () => controller.addressList.isEmpty
                  ? Center(
                      child: CustomText(
                      text: LocaleKeys.address_no_address_found_text.tr,
                      fontSize: 20,
                    ))
                  : ListView.builder(
                      itemCount: controller.addressList.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Obx(
                          () => Card(
                            color: controller.selectedIndex.value == index
                                ? colorScheme(context).secondary
                                : colorScheme(context).onPrimary,
                            child: ListTile(
                                onTap: () =>
                                    controller.selectedIndex.value = index,
                                minLeadingWidth: 5,
                                leading: const SizedBox(),
                                title: Text(
                                  controller.addressList[index].name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: controller.selectedIndex.value ==
                                              index
                                          ? colorScheme(context).surface
                                          : colorScheme(context).onSurface,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.addressList[index].address,
                                      style: controller.textStyle(index),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${LocaleKeys.address_city_text.tr} ',
                                          style: controller.textStyle2(index),
                                        ),
                                        Text(
                                          controller.addressList[index].city,
                                          style: controller.textStyle(index),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${LocaleKeys.address_postal_code_text.tr} ',
                                          style: controller.textStyle2(index),
                                        ),
                                        Text(
                                          controller
                                              .addressList[index].postalCode,
                                          style: controller.textStyle(index),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: InkWell(
                                    onTap: () => controller.confirmDeletion(
                                        context,
                                        controller.addressList[index].id,
                                        index),
                                    child: Icon(
                                      Icons.delete,
                                      color: controller.selectedIndex.value ==
                                              index
                                          ? colorScheme(context).surface
                                          : colorScheme(context).error,
                                    ))),
                          ),
                        );
                      }),
            )),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onTap: () => controller.onTapContinue(),
                text: LocaleKeys.button_continue.tr),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.ADD_ADDRESS),
          backgroundColor: colorScheme(context).primary,
          child: Icon(
            Icons.add_location_alt_outlined,
            color: colorScheme(context).onPrimary,
            size: 26,
          ),
        ),
      ),
    );
  }
}
