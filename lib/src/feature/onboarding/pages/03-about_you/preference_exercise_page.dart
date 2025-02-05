import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class PreferenceExercisePage extends StatefulWidget {
  const PreferenceExercisePage({super.key});

  @override
  State<PreferenceExercisePage> createState() => _PreferenceExercisePageState();
}

class _PreferenceExercisePageState extends State<PreferenceExercisePage> {
  List selectedIndexes = [];

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
          child: CustomProgressBar(currentStep: 5, totalSteps: 11),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const NeverScrollableScrollPhysics(),
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
                  const TextSpan(text: "Preference in "),
                  TextSpan(
                    text: "exercise",
                    style: TextStyle(color: colorScheme(context).primary),
                  ),
                  const TextSpan(text: "?"),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "You can select more than one option",
              style: textTheme(context).labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: preferenceList.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final preference = preferenceList[index];
                return InkWell(
                  onTap: () {
                    if (selectedIndexes.contains(index)) {
                      selectedIndexes.remove(index);
                    } else {
                      selectedIndexes.add(index);
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
                        foregroundImage: AssetImage(preference.image),
                      ),
                      title: Text(
                        preference.label,
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

                          setState(() {});
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.trainingTime);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
