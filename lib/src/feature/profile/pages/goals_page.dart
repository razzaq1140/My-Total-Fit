import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/profile/widgets/goals_custom_card.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final List<ChallengeCard> challenges = [];

  Future<void> _addNewGoal() async {
    // Navigate to CreateGoalPage and wait for the result
    final newGoalTitle = await context.pushNamed(AppRoute.createGoalPage);

    // If a new goal title was entered, add it to the challenges list
    if (newGoalTitle != null && newGoalTitle is String) {
      setState(() {
        challenges.add(
          ChallengeCard(
            title: newGoalTitle,
            challenge: 'Custom Challenge', // Placeholder challenge description
            percentage: 0, // Placeholder initial percentage
            image: AssetImage(AppImages.goalarm), // Placeholder image
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Goals",
          style: textTheme(context).headlineLarge?.copyWith(
                color: colorScheme(context).onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: LinearPercentIndicator(
                        lineHeight: 14.0,
                        percent: 0.6,
                        backgroundColor: AppColors.appGrey.withOpacity(0.3),
                        progressColor: AppColors.appOrange,
                        barRadius: const Radius.circular(15),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "60%",
                      style: textTheme(context).headlineLarge?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Current Status",
                  style: textTheme(context).headlineLarge?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                ChallengeCard(
                  title: 'Full Body\nWorkout',
                  challenge: '7 x 4 Challenge',
                  percentage: 42,
                  image: AssetImage(AppImages.goalarm),
                ),
                Expanded(
                  child: ListView(
                    children: challenges,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: _addNewGoal, // Updated to call _addNewGoal
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme(context).primary,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.appWhite,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
