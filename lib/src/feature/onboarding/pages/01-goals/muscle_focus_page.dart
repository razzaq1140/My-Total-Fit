import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class MuscleFocusPage extends StatefulWidget {
  const MuscleFocusPage({super.key});

  @override
  State<MuscleFocusPage> createState() => _MuscleFocusPageState();
}

class _MuscleFocusPageState extends State<MuscleFocusPage> {
  Map<String, bool> selectedMuscles = {
    "Toned Arms": false,
    "Flat Abs": false,
    "Bubble butt": false,
    "Slim leg": false,
    "Full Body": false,
  };

  void toggleSelection(String muscle) {
    setState(() {
      if (muscle == "Full Body") {
        // Toggle "Full Body" and set all other muscles to the same state
        bool newState = !selectedMuscles[muscle]!;
        selectedMuscles.updateAll((key, value) => newState);
      } else {
        // Toggle only the specific muscle
        selectedMuscles[muscle] = !(selectedMuscles[muscle] ?? false);

        // If any muscle other than "Full Body" is toggled off, uncheck "Full Body"
        if (selectedMuscles[muscle] == false) {
          selectedMuscles["Full Body"] = false;
        } else {
          // Check if all muscles are selected, then toggle "Full Body" on
          if (selectedMuscles.values.where((value) => value).length ==
              selectedMuscles.length - 1) {
            selectedMuscles["Full Body"] = true;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                context.pushNamed(AppRoute.bodyDataAnimation);
              },
              child: Text(
                'Next',
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
          child: CustomProgressBar(currentStep: 3, totalSteps: 3),
        ),
      ),
      body: Consumer<OnboardingProvider>(
        builder: (context, provider, child) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: textTheme(context)
                      .headlineSmall
                      ?.copyWith(color: Colors.black),
                  children: [
                    const TextSpan(text: "Which area would you like to "),
                    TextSpan(
                      text: "focus",
                      style: TextStyle(color: colorScheme(context).primary),
                    ),
                    const TextSpan(text: " on?"),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                            height:
                                provider.selectedGender == "male" ? 30 : 55),
                        muscleToggle(muscle: "Toned Arms"),
                        SizedBox(
                            height:
                                provider.selectedGender == "male" ? 40 : 20),
                        muscleToggle(muscle: "Flat Abs"),
                        SizedBox(
                            height:
                                provider.selectedGender == "male" ? 40 : 22),
                        muscleToggle(muscle: "Bubble butt"),
                        SizedBox(
                            height:
                                provider.selectedGender == "male" ? 45 : 30),
                        muscleToggle(muscle: "Slim leg"),
                        SizedBox(
                            height:
                                provider.selectedGender == "male" ? 30 : 30),
                        muscleToggle(muscle: "Full Body"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      provider.selectedGender == "male"
                          ? AppImages.muscleFocusMale
                          : AppImages.muscleFocus,
                      height: 400,
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container muscleToggle({required String muscle}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: selectedMuscles[muscle] == true
              ? colorScheme(context).primary.withOpacity(0.05)
              : colorScheme(context).surface,
          border: Border.all(
              color: selectedMuscles[muscle] == true
                  ? colorScheme(context).primary
                  : Colors.grey.shade200),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2,
              offset: const Offset(1.5, 2),
              spreadRadius: 2,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                muscle,
                style: textTheme(context)
                    .labelMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Checkbox(
            visualDensity: VisualDensity.compact,
            shape: const CircleBorder(),
            value: selectedMuscles[muscle],
            onChanged: (value) {
              toggleSelection(muscle);
            },
          ),
        ],
      ),
    );
  }
}
