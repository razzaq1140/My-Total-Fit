import 'package:my_total_fit/src/feature/ai_chat/pages/ai_chat_page.dart';
import 'package:my_total_fit/src/feature/home/pages/home_page.dart';
import 'package:my_total_fit/src/feature/profile/pages/profile_page.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_screens/pages/ranking_screen.dart';
import 'package:my_total_fit/src/nutrition/pages/nutrition_page.dart';

import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomePage(),
    const AiChatPage(),
    const NutritionPage(),
    const RankingScreen(),
    const ProfilePage(),
  ];

  int get currentIndex => _currentIndex;

  List<Widget> get screens => _screens;

  void changeIndex({required int index, required BuildContext context}) {
    if (index == 1) {
      context.pushNamed(AppRoute.aiChat);
      return;
    }
    _currentIndex = index;
    notifyListeners();
  }
}
