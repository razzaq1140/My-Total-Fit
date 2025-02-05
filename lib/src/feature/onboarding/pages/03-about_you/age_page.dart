import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  final List<int> numbers =
      List.generate(100, (index) => 18 + index); // Example range
  int selectedItemIndex = 4; // Default selected item index

  @override
  Widget build(BuildContext context) {
    int selectedAge = numbers[selectedItemIndex];

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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(12),
          child: CustomProgressBar(currentStep: 1, totalSteps: 11),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: textTheme(context)
                    .headlineSmall
                    ?.copyWith(color: Colors.black),
                children: [
                  const TextSpan(text: "What is your "),
                  TextSpan(
                    text: "age",
                    style: TextStyle(color: colorScheme(context).primary),
                  ),
                  const TextSpan(text: " ?"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: colorScheme(context).primary.withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.logo,
                    width: 40,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "This will help us to adjust the workouts for your age.",
                      style: textTheme(context).bodyMedium,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: ListWheelScrollView.useDelegate(
                controller:
                    FixedExtentScrollController(initialItem: selectedItemIndex),
                physics: const FixedExtentScrollPhysics(),
                itemExtent: 50.0,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedItemIndex = index;
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    bool isSelected = index == selectedItemIndex;
                    selectedAge = numbers[index];
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 5),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.red.shade50
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(123)),
                        border: Border.all(
                          color: isSelected ? Colors.red : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '$selectedAge',
                        style: TextStyle(
                          fontSize: 17,
                          color: isSelected ? Colors.black : Colors.grey,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    );
                  },
                  childCount: numbers.length,
                ),
              ),
            ),
            const SizedBox(height: 50),
            CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.daysGraph);
              },
            ),
          ],
        ),
      ),
    );
  }
}
