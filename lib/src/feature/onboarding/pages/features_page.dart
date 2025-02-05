import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class FeaturesPage extends StatefulWidget {
  const FeaturesPage({super.key});

  @override
  State<FeaturesPage> createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
  List<int> selectedIndexes = [];
  final int allOfTheAboveIndex = featuresList.length;
  bool allSelected = false;
  @override
  Widget build(BuildContext context) {
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
          child: CustomProgressBar(currentStep: 10, totalSteps: 11),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: textTheme(context)
                    .headlineSmall
                    ?.copyWith(color: Colors.black),
                children: [
                  const TextSpan(text: "What is your "),
                  TextSpan(
                    text: "main priority",
                    style: TextStyle(color: colorScheme(context).primary),
                  ),
                  const TextSpan(text: " in this app?"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: featuresList.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final time = featuresList[index];
                return InkWell(
                  onTap: () {
                    if (selectedIndexes.contains(index)) {
                      selectedIndexes.remove(index);
                    } else {
                      selectedIndexes.add(index);
                    }

                    if (featuresList.length == selectedIndexes.length) {
                      allSelected = true;
                    } else {
                      allSelected = false;
                    }

                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: selectedIndexes.contains(index)
                                ? colorScheme(context).primary
                                : Colors.grey.shade200),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: selectedIndexes.contains(index)
                            ? colorScheme(context).primary.withOpacity(0.1)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                        ]),
                    child: ListTile(
                      minVerticalPadding: 30,
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundImage: AssetImage(time.image),
                      ),
                      title: Text(
                        time.label,
                        style: textTheme(context)
                            .bodyMedium!
                            .copyWith(fontSize: 16),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      trailing: Checkbox(
                        visualDensity: VisualDensity.compact,
                        shape: const CircleBorder(),
                        side: BorderSide(
                            color: selectedIndexes.contains(index)
                                ? colorScheme(context).primary
                                : Colors.grey.shade300),
                        value: selectedIndexes.contains(index) ? true : false,
                        onChanged: (value) {
                          if (selectedIndexes.contains(index)) {
                            selectedIndexes.remove(index);
                          } else {
                            selectedIndexes.add(index);
                          }

                          if (featuresList.length == selectedIndexes.length) {
                            allSelected = true;
                          } else {
                            allSelected = false;
                          }

                          setState(() {});
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: allSelected
                          ? colorScheme(context).primary
                          : Colors.grey.shade200),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: allSelected
                      ? colorScheme(context).primary.withOpacity(0.1)
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                  ]),
              child: ListTile(
                minVerticalPadding: 30,
                leading: const Icon(Icons.arrow_circle_right_outlined),
                title: Text(
                  "All of the above",
                  style: textTheme(context).bodyMedium!.copyWith(fontSize: 16),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                trailing: Checkbox(
                  visualDensity: VisualDensity.compact,
                  shape: const CircleBorder(),
                  side: BorderSide(
                      color: allSelected
                          ? colorScheme(context).primary
                          : Colors.grey.shade300),
                  value: allSelected,
                  onChanged: (value) {
                    allSelected = value!;
                    if (allSelected) {
                      selectedIndexes =
                          List.generate(featuresList.length, (i) => i);
                      selectedIndexes.add(allOfTheAboveIndex);
                    } else {
                      // selectedIndexes.add(allOfTheAboveIndex);
                      selectedIndexes.clear();
                    }

                    setState(() {});
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.personalizedExercise);
              },
            ),
          ],
        ),
      ),
    );
  }
}
