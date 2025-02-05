import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TodayMealNutritionWidget extends StatelessWidget {
  final String title;
  final String image;
  final String value;
  final double percentage;
  final Color color;
  const TodayMealNutritionWidget({
    super.key,
    required this.title,
    required this.image,
    required this.value,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme(context).primary,
          width: 1.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: textTheme(context).labelLarge,
              ),
              const SizedBox(width: 10),
              Image.asset(
                image,
                height: 18,
              ),
              const Spacer(),
              Text(
                value,
                style: textTheme(context)
                    .labelSmall!
                    .copyWith(color: colorScheme(context).outlineVariant),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearPercentIndicator(
            progressColor: color,
            backgroundColor: Colors.grey.shade200,
            padding: EdgeInsets.zero,
            lineHeight: 10,
            percent: percentage,
            barRadius: const Radius.circular(10),
          ),
        ],
      ),
    );
  }
}
