import 'package:flutter/material.dart';
import 'package:my_total_fit/src/feature/onboarding/widgets/animated_intro_widget.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class AboutYouAnimatedPage extends StatefulWidget {
  const AboutYouAnimatedPage({super.key});

  @override
  State<AboutYouAnimatedPage> createState() => _AboutYouAnimatedPageState();
}

class _AboutYouAnimatedPageState extends State<AboutYouAnimatedPage> {
  @override
  Widget build(BuildContext context) {
    return const AnimatedIntroWidget(
        number: "03", title: "About You", nextScreen: AppRoute.age);
  }
}
