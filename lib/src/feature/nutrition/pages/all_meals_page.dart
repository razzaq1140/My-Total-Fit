import 'package:flutter/material.dart';
import 'package:my_total_fit/src/feature/nutrition/widgets/meal_by_time.dart';

class AllMealsPage extends StatelessWidget {
  const AllMealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Plan"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: MealByTime(displayLengthRow: false),
      ),
    );
  }
}
