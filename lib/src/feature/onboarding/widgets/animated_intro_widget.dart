import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AnimatedIntroWidget extends StatefulWidget {
  final String number;
  final String title;
  final String nextScreen;
  const AnimatedIntroWidget({
    super.key,
    required this.number,
    required this.title,
    required this.nextScreen,
  });

  @override
  State<AnimatedIntroWidget> createState() => _AnimatedIntroWidgetState();
}

class _AnimatedIntroWidgetState extends State<AnimatedIntroWidget>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    // Logo animation controller
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addListener(() {
        setState(() {});
      });

    // Text animation controller
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addListener(() {
        setState(() {});
      });

    // Progress animation controller
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    // Start the animations with a slight delay
    Future.delayed(const Duration(milliseconds: 200), () {
      _logoController.forward();
      _textController.forward();
      _progressController.forward();
    });

    // Navigate to next screen after animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 2500), () {
        context.pushReplacementNamed(widget.nextScreen);
      });
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.red, AppColors.appOrange],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return Transform.rotate(
                  angle:
                      _logoController.value * 0.1, // Rotate logo as it scales
                  child: AnimatedScale(
                    scale: 1 + (_logoController.value * 0.3), // Scale animation
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(
                      AppImages.logo,
                      width: screenWidth * 0.5,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Animated Number Text
            AnimatedBuilder(
              animation: _textController,
              builder: (context, child) {
                return AnimatedSlide(
                  offset: Offset(0, 50 * (1 - _textController.value)),
                  duration: const Duration(milliseconds: 500),
                  child: Opacity(
                    opacity: _textController.value,
                    child: Text(
                      widget.number,
                      style: GoogleFonts.rethinkSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 100,
                        color: Colors.white,
                        height: 0,
                      ),
                    ),
                  ),
                );
              },
            ),
            // Animated Title Text
            AnimatedBuilder(
              animation: _textController,
              builder: (context, child) {
                return AnimatedSlide(
                  offset: Offset(0, 30 * (1 - _textController.value)),
                  duration: const Duration(milliseconds: 500),
                  child: Opacity(
                    opacity: _textController.value,
                    child: Text(
                      widget.title,
                      style: GoogleFonts.rethinkSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 43,
                        color: Colors.white,
                        height: 0,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),

            // Animated Progress Bar with Pulse Effect
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1),
              duration: const Duration(milliseconds: 1000),
              builder: (context, value, child) {
                return AnimatedBuilder(
                  animation: _progressController,
                  builder: (context, child) {
                    return LinearPercentIndicator(
                      percent: value,
                      lineHeight: 6,
                      barRadius: const Radius.circular(5),
                      progressColor: Colors.white,
                      backgroundColor:
                          colorScheme(context).primary.withOpacity(0.2),
                      animation: true,
                      animationDuration: 1000,
                      // Adding a slight pulse effect on progress completion
                      onAnimationEnd: () {
                        if (_progressController.isCompleted) {
                          _progressController.forward(from: 0);
                        }
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
