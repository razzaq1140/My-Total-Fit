import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';

class DualCircularIndicatorWidget extends StatelessWidget {
  final double outerPercentage;
  final double innerPercentage;
  final String outerLabel;
  final String innerLabel;
  final VoidCallback onTap; // Declare onTap callback

  const DualCircularIndicatorWidget({
    Key? key,
    required this.outerPercentage,
    required this.innerPercentage,
    required this.outerLabel,
    required this.innerLabel,
    required this.onTap, // Add onTap as a required parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Set onTap functionality
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme(context).primary.withOpacity(0.15), // Light red background
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorScheme(context).primary, width: 2), // Red border
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Outer circular indicator
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 15.0,
                  percent: outerPercentage,
                  backgroundColor: AppColors.appGrey.withOpacity(0.1), // Light grey background
                  progressColor: colorScheme(context).primary, // Red progress color
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                // Inner circular indicator
                CircularPercentIndicator(
                  radius: 55.0,
                  lineWidth: 15.0,
                  percent: innerPercentage,
                  backgroundColor: AppColors.appGrey.withOpacity(0.1), // Light grey background
                  progressColor: AppColors.appYellow, // Orange progress color
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                // Center percentage text
                Text(
                  "${(outerPercentage * 100).toInt()}%", // Display the percentage
                  style: textTheme(context).headlineLarge?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Legend below the indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(width: 4),
                    Text(
                      outerLabel,
                      style: textTheme(context).headlineLarge?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: AppColors.appYellow,
                    ),
                    SizedBox(width: 4),
                    Text(
                      innerLabel,
                      style: textTheme(context).headlineLarge?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
