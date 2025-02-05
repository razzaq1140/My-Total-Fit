import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/nutrition/model/select_food_model.dart';
import 'package:my_total_fit/src/nutrition/pages/day_streak_page.dart';
import 'package:my_total_fit/src/nutrition/pages/select_food_page.dart';

class FoodDatabasePage extends StatefulWidget {
  const FoodDatabasePage({super.key});

  @override
  State<FoodDatabasePage> createState() => _FoodDatabasePageState();
}

class _FoodDatabasePageState extends State<FoodDatabasePage> {
  @override
  Widget build(BuildContext context) {
    List<bool> selectedDays = List.generate(7, (index) => false);
    void showDayStreakDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Builder(
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width *
                      0.85, // Responsive width
                  child: CustomDayStreakContent(
                    selectedDays: selectedDays,
                    onDayChanged: (index, value) {
                      setState(() {
                        selectedDays[index] = value;
                      });
                    },
                  ),
                );
              },
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          "Food Database",
          style: textTheme(context)
              .headlineMedium
              ?.copyWith(letterSpacing: 0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Describe what you ate",
                hintStyle: textTheme(context).titleSmall?.copyWith(
                    letterSpacing: 0,
                    color: colorScheme(context).outlineVariant),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDayStreakDialog(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CustomDayStreakContent(selectedDays: [], onDayChanged: (int index, bool value) {  },),));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme(context).primary,
                foregroundColor: colorScheme(context).onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left-aligned icon
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(AppIcons.starIcon),
                  ),
                  const SizedBox(width: 10), // Space between icon and text
                  // Center-aligned text
                  Expanded(
                    child: Text(
                      "Generate macros using AI",
                      textAlign: TextAlign.center,
                      style: textTheme(context).bodyLarge?.copyWith(
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          color: colorScheme(context).onPrimary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Suggestions",
                  style: textTheme(context)
                      .titleMedium
                      ?.copyWith(letterSpacing: 0)),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: selectFoodModelData.length,
                itemBuilder: (context, index) {
                  final data = selectFoodModelData[index];
                  return FoodItemWidget(
                    foodName: data.name,
                    calories: data.calories,
                    unit: "tbsp",
                  );
                },
              ),
            ),
            // Expanded(
            //   child: ListView(
            //     children: const [
            //       FoodItemWidget(
            //         foodName: "Peanut Butter",
            //         calories: "90 cal",
            //         unit: "tbsp",
            //       ),
            //       FoodItemWidget(
            //         foodName: "Avocado . Calavo",
            //         calories: "60 cal",
            //         unit: "serving",
            //       ),
            //       FoodItemWidget(
            //         foodName: "Egg",
            //         calories: "60 cal",
            //         unit: "large",
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class FoodItemWidget extends StatelessWidget {
  final String foodName;
  final String calories;
  final String unit;

  const FoodItemWidget({
    super.key,
    required this.foodName,
    required this.calories,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: colorScheme(context).outline.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: SvgPicture.asset(AppIcons.fireBlackIcon),
        title: Text(
          foodName,
          style: textTheme(context).labelLarge?.copyWith(letterSpacing: 0),
        ),
        subtitle: Text("$calories . $unit",
            style: textTheme(context).labelMedium?.copyWith(letterSpacing: 0)),
        trailing: IconButton(
          icon: Icon(
            Icons.add,
            color: colorScheme(context).onSurface,
          ),
          onPressed: () {
            context.pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectedFoodScreen(
                    calories: calories,
                    name: foodName,
                    time: unit,
                  ),
                ));
          },
        ),
      ),
    );
  }
}
