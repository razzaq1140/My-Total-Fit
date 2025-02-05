import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class ReadyPage extends StatefulWidget {
  const ReadyPage({super.key});

  @override
  _ReadyPageState createState() => _ReadyPageState();
}

class _ReadyPageState extends State<ReadyPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool autoMove = true;

  @override
  void initState() {
    super.initState();

    // Animation Controller for changing the gradient color
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6), // Timer countdown duration
    );

    if (autoMove) {
      Future.delayed(
        const Duration(seconds: 6),
        () => context.pushReplacementNamed(AppRoute.workoutCompleted),
      );
    }

    // Start countdown animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
              'Exercise 1/12',
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  AppImages.homeMale,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0),
                  colorScheme(context).primary
                ],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'READY TO GO',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        int remainingTime = 6 -
                            (_controller.value * 6).floor(); // Countdown logic
                        return Text(
                          '$remainingTime',
                          style: const TextStyle(
                            fontSize: 120,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    const Text(
                      'Exercise 1/12\nJUMPING JACKS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        setState(() {
                          autoMove = false;
                        });
                        context.pushReplacementNamed(AppRoute.workoutCompleted);
                      },
                      text: "Start",
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 10),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
