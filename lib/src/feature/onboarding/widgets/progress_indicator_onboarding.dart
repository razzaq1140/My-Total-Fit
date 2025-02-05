import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressIndicatorOnboarding extends StatelessWidget {
  final double progressPercent;
  const ProgressIndicatorOnboarding({super.key, required this.progressPercent});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 70.0,
      lineWidth: 12.0,
      percent: progressPercent,
      center: Text(
        "${(progressPercent * 100).toInt()}%",
        style: textTheme(context).headlineMedium,
      ),
      progressColor: colorScheme(context).primary,
      backgroundWidth: 3,
      backgroundColor: colorScheme(context).onSecondaryContainer,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
