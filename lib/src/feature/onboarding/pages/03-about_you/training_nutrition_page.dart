import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class TrainingNutritionPage extends StatefulWidget {
  const TrainingNutritionPage({super.key});

  @override
  State<TrainingNutritionPage> createState() => _TrainingNutritionPageState();
}

class _TrainingNutritionPageState extends State<TrainingNutritionPage> {
  int selectedIndex = -1;
  final List<String> trainingNutritionList = [
    "Are you interested in improving your nutrition to complement your training?",
    "Yes, but focused on managing my weight",
    "Yes, but focused on managing my weight",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                MyAppRouter.clearAndNavigate(context, AppRoute.signInPage);
              },
              child: Text(
                'Skip',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(12.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 12,
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                  color: colorScheme(context).primary,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Are you interested in improving your nutrition to complement your training?",
              style: textTheme(context).headlineLarge?.copyWith(
                  color: colorScheme(context).primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 6,
            ),
            const SizedBox(height: 30),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trainingNutritionList.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final nutrition = trainingNutritionList[index];
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: selectedIndex == index
                              ? colorScheme(context).primary
                              : Colors.grey.shade200),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: selectedIndex == index
                          ? colorScheme(context).primary.withOpacity(0.1)
                          : Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                      ]),
                  child: ListTile(
                    minVerticalPadding: 30,
                    title: Text(
                      nutrition,
                      style:
                          textTheme(context).bodyMedium!.copyWith(fontSize: 16),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    trailing: Checkbox(
                      visualDensity: VisualDensity.compact,
                      shape: const CircleBorder(),
                      side: BorderSide(
                          color: selectedIndex == index
                              ? colorScheme(context).primary
                              : Colors.grey.shade300),
                      value: selectedIndex == index ? true : false,
                      onChanged: (value) {
                        selectedIndex = index;

                        setState(() {});
                        Future.delayed(
                          const Duration(microseconds: 250),
                          () => context.pushNamed(AppRoute.personalizedFeature),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
