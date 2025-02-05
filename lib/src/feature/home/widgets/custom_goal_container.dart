import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';

class GoalContainer extends StatelessWidget {
  const GoalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: colorScheme(context).primary),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              AppImages.exercises,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Skipping',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10),
                        value: 0.6,
                        backgroundColor:
                            colorScheme(context).primary.withOpacity(0.2),
                        color: colorScheme(context).onSecondary,
                        minHeight: 9.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text('60%',
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12.0),
          IconButton(
            icon: Icon(Icons.play_circle_fill,
                color: colorScheme(context).onSecondary, size: 36.0),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
