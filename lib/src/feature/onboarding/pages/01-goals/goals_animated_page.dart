import 'package:flutter/material.dart';

import 'package:my_total_fit/src/feature/onboarding/widgets/animated_intro_widget.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class GoalsAnimatedPage extends StatefulWidget {
  const GoalsAnimatedPage({super.key});

  @override
  State<GoalsAnimatedPage> createState() => _GoalsAnimatedPageState();
}

class _GoalsAnimatedPageState extends State<GoalsAnimatedPage> {
  @override
  Widget build(BuildContext context) {
    return const AnimatedIntroWidget(
      number: "01",
      title: "Fitness Goals",
      nextScreen: AppRoute.goalsSelection,
    );
  }
}
