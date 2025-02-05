import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class LevelProgressWidget extends StatelessWidget {
  final String level;
  final String description;
  final int currentPoints;
  final int maxPoints;
  final VoidCallback onTap;

  const LevelProgressWidget({
    super.key,
    required this.level,
    required this.description,
    required this.currentPoints,
    required this.maxPoints,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the progress percentage
    double progress = currentPoints / maxPoints;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:
              AppColors.appGrey.withOpacity(0.1), // Light grey background color
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: colorScheme(context).primary, width: 2), // Red border
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              level,
              style: textTheme(context).headlineLarge?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).outline,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                // Background progress bar
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.appOrange
                        .withOpacity(0.5), // Light orange background
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // Foreground progress bar based on current points
                FractionallySizedBox(
                  widthFactor: progress, // Set progress width
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.appOrange, // Dark orange color
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                // Text overlay with current points and max points
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.orange.shade700,
                        child: Text(
                          "2", // Set static value "2"
                          style: textTheme(context).headlineLarge?.copyWith(
                                color: AppColors.appBrown,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Text(
                        "$currentPoints/$maxPoints",
                        style: textTheme(context).headlineLarge?.copyWith(
                              color: AppColors.appBrown,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.appOrange.withOpacity(0.3),
                        child: Text(
                          "3", // Set static value "3"
                          style: textTheme(context).headlineLarge?.copyWith(
                                color: AppColors.appBrown.withOpacity(0.7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
