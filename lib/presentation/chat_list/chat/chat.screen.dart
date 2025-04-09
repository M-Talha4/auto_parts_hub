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
import 'modules/chat_message_module.dart';

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
            mainAxisAlignment: MainAxisAlignment.end,
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
                          return ChatMessageModule(
                              isUserSent: isUserSent, message: message);
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
