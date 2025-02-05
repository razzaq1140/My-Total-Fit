import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ChallengeCard extends StatelessWidget {
  final String title;
  final String challenge;
  final int percentage;
  final ImageProvider image;

  const ChallengeCard({
    Key? key,
    required this.title,
    required this.challenge,
    required this.percentage,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 160,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            color: colorScheme(context).primary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme(context).primary, width: 2),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Side: Text and Progress Indicator
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme(context).headlineLarge?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      challenge,
                      style: textTheme(context).headlineLarge?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        LinearPercentIndicator(
                          width: width * 0.32, // Responsive width for indicator
                          lineHeight: 14.0,
                          percent: percentage / 100, // Dynamic percentage
                          backgroundColor: AppColors.appGrey.withOpacity(0.3),
                          progressColor: AppColors.appOrange,
                          barRadius: const Radius.circular(15),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "$percentage%",
                          style: textTheme(context).headlineLarge?.copyWith(
                                color: colorScheme(context).onSurface,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16), // Space between text and avatar
            ],
          ),
        ),
        // Positioned Avatar to appear above the container
        Positioned(
          top: 30, // Adjust to make the avatar overlap the top of the container
          right: 12,
          child: CircleAvatar(
            radius: 70, // Increased size for the avatar
            backgroundColor: AppColors.appblue,
            foregroundImage: image,
          ),
        ),
      ],
    );
  }
}
