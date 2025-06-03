import '/domain/utils/context_extensions.dart';

import '/infrastructure/dal/models/user_models/user_model.dart';
import '/infrastructure/navigation/routes.dart';
import '/presentation/widgets/custom_text.dart';
import '/generated/locales.generated.dart';
import '/domain/const/assets_paths.dart';
import '/domain/const/static_data.dart';
import 'controllers/chat_list.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatListScreen extends GetView<ChatListController> {
  const ChatListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: LocaleKeys.chat_chats_text.tr,
        ),
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
              surfaceTintColor: context.colorScheme.outline,
              child: ListTile(
                onTap: () => Get.toNamed(Routes.CHAT, arguments: person),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: context.colorScheme.outline,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: context.colorScheme.secondary,
                    child: controller.chatList[index].profileImage == ''
                        ? SvgPicture.asset(
                            ImagePath.proileAvatarSvg,
                            height: 35,
                            colorFilter: ColorFilter.mode(
                                context.colorScheme.onPrimary, BlendMode.srcIn),
                          )
                        : ClipOval(
                            child: Image.network(
                            StaticData.profileImage,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
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
