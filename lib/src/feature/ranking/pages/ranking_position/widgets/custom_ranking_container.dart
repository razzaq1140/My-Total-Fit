import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomRankingContainerone extends StatelessWidget {
  const CustomRankingContainerone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 361,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: colorScheme(context).primary),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: colorScheme(context).primary,
            ),
            child: Center(
              child: Text(
                "#4",
                style: textTheme(context).headlineMedium?.copyWith(
                    color: colorScheme(context).onPrimary,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text(
            "You are doing better than 60% \nof other players!",
            style: textTheme(context).titleSmall,
          ),
        ],
      ),
    );
  }
}
