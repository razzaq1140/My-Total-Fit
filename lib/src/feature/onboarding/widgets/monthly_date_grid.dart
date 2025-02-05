import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class MonthlyDateGrid extends StatelessWidget {
  const MonthlyDateGrid({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime lastDate = DateTime(now.year, now.month + 1, 0);
    Random random = Random();
    int min = now.day;
    int max = lastDate.day;

    List<int> randomNumList = [];
    for (var i = 0; i < 10; i++) {
      randomNumList.add(min + random.nextInt(max - min + 1));
    }

    List<Widget> dateWidgets = [];
    for (int day = now.day; day <= lastDate.day; day++) {
      dateWidgets.add(
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: randomNumList.contains(day)
                ? Colors.grey.shade300
                : colorScheme(context).primary.withOpacity(0.3),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Column(
            mainAxisAlignment: randomNumList.contains(day)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              if (!randomNumList.contains(day)) const CircleAvatar(radius: 2),
              Text(
                "$day",
                style: GoogleFonts.kantumruyPro(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (!randomNumList.contains(day)) const SizedBox(),
            ],
          ),
        ),
      );
    }

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 6,
      padding: const EdgeInsets.all(8),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      shrinkWrap: true,
      children: dateWidgets,
    );
  }
}
