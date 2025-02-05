import 'package:my_total_fit/src/feature/ai_chat/model/ai_chat_model.dart';
import 'package:flutter/material.dart';

class AiChatProvider extends ChangeNotifier {
  final TextEditingController _chatController = TextEditingController();
  final List<AiChatModel> _aiChatListProvider = aiChatList;
  final ScrollController _scrollController = ScrollController();

  List<AiChatModel> get aiChatListProvider => _aiChatListProvider;
  TextEditingController get chatController => _chatController;
  ScrollController get scrollController => _scrollController;

  void sendMessage({required AiChatModel aiChatModel}) async {
    aiChatListProvider.add(aiChatModel);
    chatController.clear();
    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    notifyListeners();
  }
}
