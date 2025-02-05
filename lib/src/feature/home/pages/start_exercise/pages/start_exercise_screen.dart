import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:my_total_fit/src/common/constents/app_animations.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/home/pages/new_work_out/widgets/custom_workout_button.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class StartExerciseScreen extends StatefulWidget {
  const StartExerciseScreen({super.key});

  @override
  StartExerciseScreenState createState() => StartExerciseScreenState();
}

class StartExerciseScreenState extends State<StartExerciseScreen> {
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;

  final String currentExerciseName = "Stretching Workout Length";
  final String nextExerciseName = "Exercises with Sitting Dumbbells";
  final String nextExerciseDuration = "5 min";
  int currentExerciseIndex = 3;
  int totalExercises = 12;

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
    });
    _timer?.cancel();
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(AppAnimations.stretch,
                  fit: BoxFit.cover, animate: _isRunning),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomImageContainer(),

                    const SizedBox(height: 15),
                    Text('Exercise $currentExerciseIndex/$totalExercises',
                        style: textTheme(context).bodyLarge?.copyWith(
                            color: AppColors.gary,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(currentExerciseName,
                        style: textTheme(context)
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: CircularProgressIndicator(
                              value: _seconds / 600,
                              strokeWidth: 8,
                              backgroundColor:
                                  colorScheme(context).onSecondaryContainer,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.orange),
                            ),
                          ),
                          Text(_formatTime(_seconds),
                              style: textTheme(context).labelMedium),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "10:59",
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: _isRunning ? _stopTimer : _startTimer,
                            icon: Icon(
                              _isRunning ? Icons.stop : Icons.play_arrow,
                              color: colorScheme(context).onSurface,
                            ),
                            label: Text(_isRunning ? "Stop" : "Start",
                                style: textTheme(context).bodySmall),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: BorderSide(
                                      color: colorScheme(context).onSurface)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: CustomWorkoutButton(
                              text: Row(
                                children: [
                                  Icon(
                                    Icons.directions_run_outlined,
                                    color: colorScheme(context).onPrimary,
                                  ),
                                  Text(
                                    "Next Traning",
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                            color:
                                                colorScheme(context).onPrimary),
                                  )
                                ],
                              ),
                              onTap: () {
                                context.pushNamed(AppRoute.workouttracking);
                              },
                              color: colorScheme(context).primary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Up Next",
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppImages.doumble),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          children: [
                            Text(
                              "Exercises with Sitting \n Dumbbells",
                              style: textTheme(context)
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.calories,
                                  height: 15,
                                  color: colorScheme(context).secondary,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "135 Kcal",
                                  style: textTheme(context).bodySmall,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "|",
                                  style: textTheme(context).bodyMedium,
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                  AppIcons.clock1,
                                  color: colorScheme(context).secondary,
                                  height: 15,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "5 min",
                                  style: textTheme(context).bodySmall,
                                )
                              ],
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator(
                                value: 0.6,
                                strokeWidth: 8,
                                backgroundColor:
                                    colorScheme(context).onSecondaryContainer,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.orange),
                              ),
                            ),
                            Text(
                              "00:19",
                              style: textTheme(context).labelSmall,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
