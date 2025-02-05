import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/ai_chat/model/ai_chat_model.dart';
import 'package:flutter/material.dart';

class AiRepsondPage extends StatelessWidget {
  const AiRepsondPage({super.key});

  @override
  Widget build(BuildContext context) {
    int userIndex = 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Ai Responds"),
        actions: [
          IconButton(
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(
              side: BorderSide(
                color: colorScheme(context).primary,
              ),
            ),
            onPressed: () {},
            icon: Image.asset(
              AppImages.female,
              height: 30,
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.aiRespondBG),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 10, right: 10, top: 140),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 80),
              decoration: BoxDecoration(
                  color: colorScheme(context).surface,
                  border: Border(
                    left: BorderSide(
                      color: colorScheme(context).primary,
                      width: 3,
                    ),
                    right: BorderSide(
                      color: colorScheme(context).primary,
                      width: 3,
                    ),
                    top: BorderSide(
                      color: colorScheme(context).primary,
                      width: 3,
                    ),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(4))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Fitness Knowledge",
                    style: textTheme(context).titleLarge,
                  ),
                  Text(
                    "Get paid when users engage with your bots.",
                    style: textTheme(context).bodyLarge!.copyWith(
                        color: colorScheme(context).primary,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: aiChatList.length + 1,
                      itemBuilder: (context, index) {
                        if (index < aiChatList.length) {
                          final chat = aiChatList[index];
                          if (chat.type == 'user') {
                            userIndex++;
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: colorScheme(context).primary,
                                ),
                              ),
                              child: Text(
                                "$userIndex. ${chat.message}",
                                style: textTheme(context).labelMedium!.copyWith(
                                    color: colorScheme(context).primary),
                              ),
                            );
                          } else {
                            return Text(chat.message);
                          }
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.party,
                                  height: 50,
                                ),
                                const SizedBox(width: 3),
                                Expanded(
                                  child: Text(
                                    "Hope these tips help you Manage your fitness goals!",
                                    style: textTheme(context)
                                        .labelMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(AppImages.aiRespond),
          ],
        ),
      ),
    );
  }
}
