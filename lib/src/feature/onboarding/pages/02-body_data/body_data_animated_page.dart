import 'package:flutter/material.dart';

import 'package:my_total_fit/src/feature/onboarding/widgets/animated_intro_widget.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class BodyDataAnimatedPage extends StatefulWidget {
  const BodyDataAnimatedPage({super.key});

  @override
  State<BodyDataAnimatedPage> createState() => _BodyDataAnimatedPageState();
}

class _BodyDataAnimatedPageState extends State<BodyDataAnimatedPage> {
  @override
  Widget build(BuildContext context) {
    return const AnimatedIntroWidget(
      number: "02",
      title: "Body data",
      nextScreen: AppRoute.currentBodyShape,
    );
  }
}
