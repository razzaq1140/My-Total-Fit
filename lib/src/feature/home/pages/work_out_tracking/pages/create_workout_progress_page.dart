import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CreateWorkoutProgressPage extends StatefulWidget {
  const CreateWorkoutProgressPage({super.key});

  @override
  State<CreateWorkoutProgressPage> createState() =>
      _CreateWorkoutProgressPageState();
}

class _CreateWorkoutProgressPageState extends State<CreateWorkoutProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define Tween for animating the percent
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            setState(() {}); // Update the UI
          });

    // Start the animation
    _animationController.forward();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        context.pushReplacementNamed(AppRoute.workoutList);
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "GENERATING YOUR CUSTOM WORKOUT",
                textAlign: TextAlign.center,
                style: textTheme(context)
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              CircularPercentIndicator(
                radius: 70,
                lineWidth: 12,
                circularStrokeCap: CircularStrokeCap.round,
                percent: _animation.value,
                center: Text(
                  "${(_animation.value * 100).toInt()}%",
                  style: textTheme(context)
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
