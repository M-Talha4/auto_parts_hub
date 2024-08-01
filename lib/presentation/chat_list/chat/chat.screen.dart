import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/chat_model/message_model.dart';
import 'package:auto_parts_hub/infrastructure/theme/imports.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/chat.controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: controller.user.name,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 26,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder(
                stream: controller.getMessages(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Expanded(
                      child: Center(
                          child: CustomText(
                        text: 'Something went wrong!',
                        fontSize: AppTextSize.headlineSmallFont,
                        color: colorScheme(context).error,
                      )),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Expanded(
                      child: Center(
                          child: CustomText(
                        text: 'Type your First Message!',
                        fontSize: AppTextSize.headlineSmallFont,
                      )),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Expanded(
                      child: Center(
                          child: CustomText(
                        text: 'Loading ...',
                        fontSize: AppTextSize.headlineSmallFont,
                      )),
                    );
                  } else {
                    List<MessageModel> messages = controller.getList(snapshot);
                    return ListView.builder(
                        itemCount: messages.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          MessageModel message = messages[index];
                          bool isUserSent =
                              StaticData.userId == message.senderId;
                          return Column(
                            crossAxisAlignment: isUserSent
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: isUserSent
                                        ? colorScheme(context).secondary
                                        : colorScheme(context).outlineVariant,
                                    borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(isUserSent ? 0 : 12),
                                      topLeft:
                                          Radius.circular(isUserSent ? 12 : 0),
                                      bottomRight: const Radius.circular(12),
                                      bottomLeft: const Radius.circular(12),
                                    )),
                                child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 250),
                                  child: CustomText(
                                    text: message.message,
                                    color: colorScheme(context).onPrimary,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomText(
                                    text: controller
                                        .convertTime(message.timestamp),
                                    fontSize: AppTextSize.bodyMediumFont,
                                    color: colorScheme(context).outline,
                                  ),
                                  isUserSent
                                      ? Obx(
                                          () => Icon(
                                            controller.isLoading.value == true
                                                ? Icons.timer_outlined
                                                : Icons.done_all_rounded,
                                            color: colorScheme(context).outline,
                                            size: AppTextSize.bodyMediumFont,
                                          ).paddingOnly(left: 4),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            ],
                          ).paddingOnly(bottom: 12);
                        });
                  }
                },
              ),
              Row(
                children: [
                  Flexible(
                      child: CustomTextFormField(
                    controller: controller.chatController,
                    bordercolor: colorScheme(context).secondary,
                    borderradius: 16,
                    onFieldSubmitted: (p0) => controller.sendMessages(),
                  )),
                  InkWell(
                      onTap: controller.sendMessages,
                      child: Icon(
                        Icons.send,
                        color: colorScheme(context).primary,
                      )).paddingOnly(left: 8)
                ],
              ),
            ],
          ),
        ));
  }
}
