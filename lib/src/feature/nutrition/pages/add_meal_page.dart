import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/home/widgets/custom_row.dart';
import 'package:my_total_fit/src/feature/nutrition/model/meal_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class AddMealPage extends StatefulWidget {
  const AddMealPage({super.key});

  @override
  State<AddMealPage> createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  final List selectedMeals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Add Meal Plan"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomRow(
              text1: "Breakfast",
              onTap: () => context.pushNamed(AppRoute.allMeals),
            ),
            const SizedBox(height: 10),
            _mealWidget(category: "breakfast"),
            const SizedBox(height: 20),
            CustomRow(
              text1: "lunch",
              onTap: () => context.pushNamed(AppRoute.allMeals),
            ),
            const SizedBox(height: 10),
            _mealWidget(category: "lunch"),
            const SizedBox(height: 20),
            CustomRow(
              text1: "dinner",
              onTap: () => context.pushNamed(AppRoute.allMeals),
            ),
            const SizedBox(height: 10),
            _mealWidget(category: "dinner"),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                context.pop();
                context.pop();
              },
              text: "Done",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  SizedBox _mealWidget({required String category}) {
    List<MealModel> filteredMeals =
        mealsList.where((meal) => meal.category == category).toList();
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filteredMeals.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final meal = filteredMeals[index];
          final isSelected = selectedMeals.contains(meal);

          return Container(
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                color: colorScheme(context).primary,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: AppColors.amber.withOpacity(0.3),
                    child: Image.asset(
                      meal.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    meal.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme(context)
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        meal.value,
                        style: textTheme(context).labelSmall,
                      ),
                      Checkbox(
                        activeColor: colorScheme(context).onSurface,
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            setState(() {
                              if (value == true) {
                                selectedMeals.add(meal);
                              } else {
                                selectedMeals.remove(meal);
                              }
                            });
                            print(selectedMeals);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          );
        },
      ),
    );
  }
}
