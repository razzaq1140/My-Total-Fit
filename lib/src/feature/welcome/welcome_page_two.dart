import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePageTwo extends StatefulWidget {
  const WelcomePageTwo({super.key});

  @override
  State<WelcomePageTwo> createState() => _WelcomePageTwoState();
}

class _WelcomePageTwoState extends State<WelcomePageTwo>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoScaleAnimation;

  late AnimationController _textController;
  late Animation<Offset> _welcomeSlideAnimation;
  late Animation<Offset> _coachSlideAnimation;
  late Animation<double> _fadeAnimation;

  late AnimationController _buttonController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();

    // Logo Bounce Animation
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _logoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );
    _logoController.forward();

    // Text Slide & Fade Animations
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _welcomeSlideAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _coachSlideAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );

    // Delay the start of text animations
    Future.delayed(const Duration(milliseconds: 200), () {
      _textController.forward();
    });

    // Button Animation (Grow effect)
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _buttonScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeOutBack),
    );

    // Delay button animation slightly after text appears
    Future.delayed(const Duration(milliseconds: 500), () {
      _buttonController.forward();
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ScaleTransition(
                        scale: _logoScaleAnimation,
                        child: Image.asset(
                          AppImages.logo,
                          height: 146,
                          width: 206,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Staggered Slide and Fade Text Animations
                      SlideTransition(
                        position: _welcomeSlideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text(
                            "Welcome!",
                            style: textTheme(context).headlineLarge?.copyWith(
                                  color: colorScheme(context).primary,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SlideTransition(
                        position: _coachSlideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text(
                            "here are some questions tailor a personalized plan for you.",
                            textAlign: TextAlign.center,
                            style: textTheme(context).headlineMedium?.copyWith(
                                  color: colorScheme(context).onSurface,
                                  fontSize: 20,
                                ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAnimatedButton(
                    text: "Start Now",
                    onTap: () => context.pushNamed(AppRoute.genderSelection),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
