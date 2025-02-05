import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/home/widgets/custom_row.dart';
import 'package:my_total_fit/src/feature/nutrition/model/meal_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class MealByTime extends StatefulWidget {
  final int? itemsLength;
  final bool displayLengthRow;
  const MealByTime({super.key, this.itemsLength, this.displayLengthRow = true});

  @override
  State<MealByTime> createState() => _MealByTimeState();
}

class _MealByTimeState extends State<MealByTime>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Breakfast"),
            Tab(text: "Lunch"),
            Tab(text: "Dinner"),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          indicatorPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          indicatorSize: TabBarIndicatorSize.tab,
          padding: EdgeInsets.zero,
          dividerHeight: 0,
          indicator: BoxDecoration(
            color: colorScheme(context).onSecondary,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildMealContent(category: "breakfast"),
              _buildMealContent(category: "lunch"),
              _buildMealContent(category: "dinner"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMealContent({required String category}) {
    return SingleChildScrollView(
      child: _buildMealGrid(
        category: category,
        itemsLength: widget.itemsLength,
        dispalyLength: widget.displayLengthRow,
      ),
    );
  }

  Widget _buildMealGrid(
      {required String category,
      int? itemsLength,
      required bool dispalyLength}) {
    List<MealModel> fileteredMeals = mealsList
        .where(
          (meal) => meal.category == category,
        )
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        if (dispalyLength)
          CustomRow(
            text1: "${fileteredMeals.length} meals",
            onTap: () => context.pushNamed(AppRoute.allMeals),
          ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          itemCount: itemsLength ?? fileteredMeals.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 187,
          ),
          itemBuilder: (context, index) {
            final meal = fileteredMeals[index];
            return InkWell(
              onTap: () => context.pushNamed(AppRoute.mealDetails, extra: meal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.amber.withOpacity(0.3),
                        border: Border.all(color: colorScheme(context).primary),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Image.asset(
                        meal.image,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    meal.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme(context)
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department_outlined,
                        size: 12,
                        color: AppColors.blue,
                      ),
                      Text(
                        meal.value,
                        style: textTheme(context).labelSmall,
                      ),
                      const Text(" | "),
                      Icon(
                        Icons.access_time_rounded,
                        size: 12,
                        color: AppColors.blue,
                      ),
                      Text(
                        meal.duration,
                        style: textTheme(context).labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
