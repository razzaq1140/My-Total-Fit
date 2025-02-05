import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/nutrition/model/meal_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class MealDetailsPage extends StatelessWidget {
  final MealModel meal;
  const MealDetailsPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme(context).onSecondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme(context).onSecondary,
              ),
              child: Column(
                children: [
                  Image.asset(
                    meal.image,
                    height: screenWidth * 0.3,
                    width: screenWidth * 0.3,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colorScheme(context).surface,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.local_fire_department_outlined,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(meal.value),
                          ],
                        ),
                        const Text(" | "),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(meal.duration),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Fat",
                      style: textTheme(context).labelMedium,
                    ),
                    Text(
                      meal.fat,
                      style: textTheme(context).labelLarge,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Protein",
                      style: textTheme(context).labelMedium,
                    ),
                    Text(
                      meal.protein,
                      style: textTheme(context).labelLarge,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Carbs",
                      style: textTheme(context).labelMedium,
                    ),
                    Text(
                      meal.carbs,
                      style: textTheme(context).labelLarge,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.title,
                    style: textTheme(context).titleMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    meal.details,
                    style: textTheme(context).bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Meal Plan",
                    style: textTheme(context).titleMedium,
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset(AppImages.tortilla),
                        title: Text(meal.title),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Fat",
                                  style: textTheme(context).labelMedium,
                                ),
                                Text(
                                  meal.fat,
                                  style: textTheme(context).labelLarge,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Protein",
                                  style: textTheme(context).labelMedium,
                                ),
                                Text(
                                  meal.protein,
                                  style: textTheme(context).labelLarge,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Carbs",
                                  style: textTheme(context).labelMedium,
                                ),
                                Text(
                                  meal.carbs,
                                  style: textTheme(context).labelLarge,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                      onTap: () => context.pushNamed(AppRoute.addPlan),
                      text: 'Create plan'),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
