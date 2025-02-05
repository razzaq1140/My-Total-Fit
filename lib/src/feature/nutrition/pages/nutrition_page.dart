import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/nutrition/model/today_meal_nutrition_model.dart';
import 'package:my_total_fit/src/feature/nutrition/widgets/calories_detail_widget.dart';
import 'package:my_total_fit/src/feature/nutrition/widgets/meal_by_time.dart';
import 'package:my_total_fit/src/feature/nutrition/widgets/today_meal_nutrition_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Meal Plan"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: colorScheme(context).primary,
                foregroundColor: Colors.white,
              ),
              onPressed: () => context.pushNamed(AppRoute.addPlan),
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CaloriesDetailWidget(),
            const SizedBox(height: 10),
            Text(
              "Today Meal Nutritions",
              style: textTheme(context).titleMedium,
            ),
            const SizedBox(height: 10),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: todayMealNutritionList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final nutrition = todayMealNutritionList[index];
                return TodayMealNutritionWidget(
                  title: nutrition.title,
                  image: nutrition.image,
                  value: nutrition.value,
                  percentage: nutrition.percentage,
                  color: nutrition.color,
                );
              },
            ),
            const SizedBox(height: 20),
            const SizedBox(
                height: 480,
                child: MealByTime(
                  itemsLength: 4,
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
