import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_textField.dart';
import 'package:my_total_fit/src/common/widgets/custom_widgets.dart';
import 'package:my_total_fit/src/feature/ai_chat/model/ai_chat_model.dart';
import 'package:my_total_fit/src/feature/ai_chat/provider/ai_chat_provider.dart';
import 'package:my_total_fit/src/feature/ai_chat/widgets/chat_option_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_total_fit/src/feature/ai_chat/widgets/custom_drawer.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leadingWidth: 130,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: SvgPicture.asset(
                  AppIcons.mn,
                  height: 40,
                  width: 42,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                AppImages.aiChat,
                height: 54,
                width: 47,
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ai Chat",
              style: textTheme(context).headlineSmall,
            ),
            Row(
              children: [
                Text(
                  "● Online",
                  style: textTheme(context).titleSmall!.copyWith(
                        color: const Color(0xff3ABF38),
                      ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(AppIcons.volumeUp)
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // CustomWidgets.customDialog(
              //   context: context,
              //   title: "Ai Respond Save",
              //   subtitle: "Congrats Ai Respond has been saved in your profile",
              //   actionTxt: "View Respond",
              //   onAction: () {
              //     Navigator.pop(context);
              //     context.pushNamed(AppRoute.aiRespond);
              //   },
              // );
            },
            icon: SvgPicture.asset(AppIcons.replace),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer<AiChatProvider>(
              builder: (context, aiChatProvider, child) => Expanded(
                child: ListView.builder(
                  itemCount: aiChatProvider.aiChatListProvider.length,
                  controller: aiChatProvider.scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final chat = aiChatProvider.aiChatListProvider[index];
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 5),
                            Flexible(
                              child: Align(
                                alignment: chat.type == "ai"
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: chat.type == "ai" ? 0 : 25,
                                    right: chat.type == "ai" ? 25 : 0,
                                  ),
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: chat.type == "ai"
                                          ? colorScheme(context).onSecondary
                                          : colorScheme(context).onSurface,
                                    ),
                                    color: chat.type == "ai"
                                        ? colorScheme(context)
                                            .primary
                                            .withOpacity(0.1)
                                        : colorScheme(context).primaryContainer,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: chat.type == "user"
                                            ? const Radius.circular(25)
                                            : Radius.zero,
                                        bottomRight: const Radius.circular(25),
                                        topRight: chat.type == "ai"
                                            ? const Radius.circular(25)
                                            : Radius.zero,
                                        topLeft: const Radius.circular(25)),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        chat.message,
                                        style: chat.type == "ai"
                                            ? textTheme(context).bodyMedium
                                            : textTheme(context)
                                                .bodyMedium!
                                                .copyWith(color: Colors.white),
                                        textAlign: chat.type == "ai"
                                            ? TextAlign.left
                                            : TextAlign.right,
                                      ),
                                      if (chat.type == "ai")
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                          ),
                                          margin: const EdgeInsets.only(top: 4),
                                          height: 35,
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 10),
                                              ChatOptionIcon(
                                                icon: AppIcons.copy,
                                                onTap: () {},
                                              ),
                                              const SizedBox(width: 10),
                                              ChatOptionIcon(
                                                icon: AppIcons.like,
                                                onTap: () {},
                                              ),
                                              const SizedBox(width: 10),
                                              ChatOptionIcon(
                                                icon: AppIcons.volume,
                                                onTap: () {},
                                              ),
                                              const Spacer(),
                                              ChatOptionIcon(
                                                icon: AppIcons.repeat,
                                                onTap: () {},
                                              ),
                                              const SizedBox(width: 10),
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Align(
                          alignment: chat.type == "ai"
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor:
                                colorScheme(context).primary.withOpacity(0.3),
                            foregroundImage: AssetImage(chat.type == "ai"
                                ? AppImages.aiChat
                                : AppImages.female),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    spreadRadius: 2,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Consumer<AiChatProvider>(
                builder: (context, aiChatProvider, child) => Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: aiChatProvider.chatController,
                        borderColor: Colors.transparent,
                        hint: 'write a message...',
                        focusBorderColor: Colors.transparent,
                        borderRadius: 30,
                        textStyle: GoogleFonts.nunito(
                          color: colorScheme(context).primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (aiChatProvider.chatController.text.isNotEmpty) {
                          final AiChatModel chat = AiChatModel(
                            id: DateTime.now()
                                .microsecondsSinceEpoch
                                .toString(),
                            type: 'user',
                            message: aiChatProvider.chatController.text,
                            time: DateTime.now(),
                          );

                          aiChatProvider.sendMessage(aiChatModel: chat);
                        }
                      },
                      icon: SvgPicture.asset(AppIcons.send),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
