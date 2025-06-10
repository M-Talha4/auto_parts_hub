import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_pagination/firebase_pagination.dart';

import '../../../domain/const/const.dart';
import '../../../infrastructure/dal/services/firebase_services/user_services.dart';
import '/domain/utils/context_extensions.dart';
import '/infrastructure/dal/models/chat_model/message_model.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/custom_text_field.dart';
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
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: FirestorePagination(
                  isLive: true,
                  limit: 45,
                  query: FirebaseFirestore.instance
                      .collection(firebaseChatCollection)
                      .doc(controller.getChatRoomId())
                      .collection(firebaseChatSubCollectionMessage)
                      .orderBy('timestamp', descending: true),
                  initialLoader: Center(child: CircularProgressIndicator()),
                  onEmpty: Center(
                    child: CustomText(
                      text: 'Type your First Message!',
                      fontSize: AppTextSize.headlineSmallFont,
                    ),
                  ),
                  reverse: true,
                  itemBuilder: (buildContext, docs, index) {
                    MessageModel message = MessageModel.fromJson(
                        docs[index].data() as Map<String, dynamic>);
                    bool isUserSent =
                        Get.find<UserServices>().user.value.userId ==
                            message.senderId;
                    return ChatMessageModule(
                        isUserSent: isUserSent, message: message);
                  },
                ),
              ),
              // StreamBuilder(
              //   stream: controller.getMessages(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasError) {
              //       return Expanded(
              //         child: Center(
              //             child: CustomText(
              //           text: 'Something went wrong!',
              //           fontSize: AppTextSize.headlineSmallFont,
              //           color: context.colorScheme.error,
              //         )),
              //       );
              //     } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              //       return const Expanded(
              //         child: Center(
              //             child: CustomText(
              //           text: 'Type your First Message!',
              //           fontSize: AppTextSize.headlineSmallFont,
              //         )),
              //       );
              //     } else if (snapshot.connectionState ==
              //         ConnectionState.waiting) {
              //       return const Expanded(
              //         child: Center(
              //             child: CustomText(
              //           text: 'Loading ...',
              //           fontSize: AppTextSize.headlineSmallFont,
              //         )),
              //       );
              //     } else {
              //       List<MessageModel> messages = controller.getList(snapshot);
              //       return ListView.builder(
              //           itemCount: messages.length,
              //           shrinkWrap: true,
              //           itemBuilder: (context, index) {
              //             MessageModel message = messages[index];
              //             bool isUserSent =
              //                 Get.find<UserServices>().user.value.userId ==
              //                     message.senderId;
              //             return ChatMessageModule(
              //                 isUserSent: isUserSent, message: message);
              //           });
              //     }
              //   },
              // ),
              Row(
                children: [
                  Flexible(
                      child: CustomTextFormField(
                    controller: controller.chatController,
                    borderColor: context.colorScheme.secondary,
                    borderRadius: 16,
                    onFieldSubmitted: (p0) => controller.sendMessages(),
                  )),
                  InkWell(
                      onTap: controller.sendMessages,
                      child: Icon(
                        Icons.send,
                        color: context.colorScheme.primary,
                      )).paddingOnly(left: 8)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
