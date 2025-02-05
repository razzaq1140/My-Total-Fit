import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/profile/widgets/achievement_custom_level_box.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AchievementPage extends StatefulWidget {
  const AchievementPage({super.key});

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Achievements",
          style: textTheme(context).headlineLarge?.copyWith(
                color: colorScheme(context).onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Responsive Linear Percent Indicator
                Expanded(
                  child: LinearPercentIndicator(
                    lineHeight: 14.0,
                    percent: 1.0,
                    backgroundColor: AppColors.appGrey.withOpacity(0.3),
                    progressColor: AppColors.amber,
                    barRadius: const Radius.circular(15),
                  ),
                ),
                // Responsive Text
                Text(
                  "100%",
                  style: textTheme(context).headlineLarge?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            LevelProgressWidget(
              level: "Level 02",
              description: "500 Points to next level",
              currentPoints: 5200,
              maxPoints: 6000,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            LevelProgressWidget(
              level: "Level 01",
              description: "500 Points to next level",
              currentPoints: 5200,
              maxPoints: 6000,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
