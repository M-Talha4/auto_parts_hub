import '/domain/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../infrastructure/dal/models/chat_model/message_model.dart';
import '../../../../infrastructure/theme/text_size.dart';
import '../../../widgets/custom_text.dart';
import '../controllers/chat.controller.dart';

class ChatMessageModule extends StatelessWidget {
  final bool isUserSent;
  final MessageModel message;

  const ChatMessageModule(
      {super.key, required this.isUserSent, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isUserSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: isUserSent
                  ? context.colorScheme.secondary
                  : context.colorScheme.outlineVariant,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(isUserSent ? 0 : 12),
                topLeft: Radius.circular(isUserSent ? 12 : 0),
                bottomRight: const Radius.circular(12),
                bottomLeft: const Radius.circular(12),
              )),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: CustomText(
              text: message.message,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
        GetBuilder(
          init: Get.find<ChatController>(),
          builder: (controller) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: controller.convertTime(message.timestamp),
                  fontSize: AppTextSize.bodyMediumFont,
                  color: context.colorScheme.outline,
                ),
                isUserSent
                    ? Obx(
                        () => Icon(
                          controller.isLoading.value == true
                              ? Icons.timer_outlined
                              : Icons.done_all_rounded,
                          color: context.colorScheme.outline,
                          size: AppTextSize.bodyMediumFont,
                        ).paddingOnly(left: 4),
                      )
                    : const SizedBox()
              ],
            );
          },
        )
      ],
    ).paddingOnly(bottom: 12);
  }
}
