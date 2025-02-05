import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _scale = 0;
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        setState(() {
          _scale = 1;
        });
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
      context.pushReplacementNamed(AppRoute.welcomeOne);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorScheme(context).primary,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: _scale,
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                AppImages.logo,
                width: screenWidth * 0.55,
              ),
            ),
            const SizedBox(height: 5),
            Text("MYTOTALFIT",
                style: textTheme(context).headlineLarge?.copyWith(
                    color: colorScheme(context).surface,
                    fontSize: 24,
                    fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
