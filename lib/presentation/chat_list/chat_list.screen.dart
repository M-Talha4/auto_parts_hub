import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/domain/const/assets_paths.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'controllers/chat_list.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatListScreen extends GetView<ChatListController> {
  const ChatListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: LocaleKeys.chat_chats_text.tr,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 26,
            )),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.chatList.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            UserModel person = controller.chatList[index];
            return Card(
              surfaceTintColor: colorScheme(context).outline,
              child: ListTile(
                onTap: () => Get.toNamed(Routes.CHAT, arguments: person),
                leading: CircleAvatar(
                  radius: width * 0.078,
                  backgroundColor: colorScheme(context).outline,
                  child: CircleAvatar(
                    radius: width * 0.072,
                    backgroundColor: colorScheme(context).secondary,
                    child: StaticData.profileImage == ''
                        ? SvgPicture.asset(
                            ImagePath.proileAvatarSvg,
                            height: width * 0.07,
                            colorFilter: ColorFilter.mode(
                                colorScheme(context).onPrimary,
                                BlendMode.srcIn),
                          )
                        : ClipOval(
                            child: Image.network(
                            StaticData.profileImage,
                            fit: BoxFit.cover,
                            width: width * 0.36,
                          )),
                  ),
                ),
                title: CustomText(text: person.name),
                subtitle: CustomText(
                  text: person.email,
                ),
              ),
            ).paddingAll(12);
          },
        ),
      ),
    );
  }
}
