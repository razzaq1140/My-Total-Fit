import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class WeightPickerScreen extends StatefulWidget {
  const WeightPickerScreen({super.key});

  @override
  _WeightPickerScreenState createState() => _WeightPickerScreenState();
}

class _WeightPickerScreenState extends State<WeightPickerScreen> {
  final RulerPickerController _rulerPickerController =
      RulerPickerController(value: 85.0);
  bool isKg = true;
  double selectedWeight = 85.0;

  List<RulerRange> ranges = const [
    RulerRange(begin: 0, end: 300, scale: 0.1),
  ];

  void selectLbs() {
    setState(() {
      if (isKg) {
        isKg = false;
        selectedWeight /= 0.4536;
        _rulerPickerController.value = selectedWeight;
      }
    });
  }

  void selectKg() {
    setState(() {
      if (!isKg) {
        isKg = true;
        selectedWeight *= 0.4536;
        _rulerPickerController.value = selectedWeight;
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
          child: CustomProgressBar(currentStep: 4, totalSteps: 10),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: textTheme(context)
                    .headlineSmall
                    ?.copyWith(color: Colors.black),
                children: [
                  const TextSpan(text: "What is your "),
                  TextSpan(
                    text: "current",
                    style: TextStyle(color: colorScheme(context).primary),
                  ),
                  const TextSpan(text: " weight?"),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 45,
              width: 120,
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme(context).primary),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: selectLbs,
                    child: Container(
                      decoration: BoxDecoration(
                        color: !isKg
                            ? colorScheme(context).primary
                            : colorScheme(context).onPrimary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        'IBS',
                        style: textTheme(context).labelLarge?.copyWith(
                            color: !isKg
                                ? colorScheme(context).onPrimary
                                : colorScheme(context).primary),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: selectKg,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isKg
                            ? colorScheme(context).primary
                            : colorScheme(context).onPrimary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        'KG',
                        style: textTheme(context).labelLarge?.copyWith(
                            color: isKg
                                ? colorScheme(context).onPrimary
                                : colorScheme(context).primary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${selectedWeight.toStringAsFixed(1)} ${isKg ? 'kg' : 'lbs'}',
                  style: textTheme(context).headlineLarge,
                ),
                const SizedBox(width: 10),
                Icon(Icons.arrow_left_rounded,
                    color: colorScheme(context).primary),
                Consumer<OnboardingProvider>(
                  builder: (context, provider, child) {
                    final String bmi =
                        (selectedWeight / pow(provider.currentHeightMeter, 2))
                            .toStringAsFixed(1);
                    return Text(
                      bmi,
                      style: textTheme(context).labelMedium,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: RulerPicker(
                controller: _rulerPickerController,
                ranges: ranges,
                onBuildRulerScaleText: (index, value) {
                  return value.toInt().toString();
                },
                rulerScaleTextStyle: const TextStyle(color: Colors.black),
                width: 200,
                height: 70,
                rulerMarginTop: 10,
                marker: Container(
                  width: 2,
                  height: 50,
                  color: colorScheme(context).primary,
                ),
                onValueChanged: (num value) {
                  setState(() {
                    selectedWeight = value.toDouble();
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: colorScheme(context).primary.withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImages.logo,
                        width: 40,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Your current BMI",
                          style: textTheme(context)
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                  Consumer<OnboardingProvider>(
                    builder: (context, provider, child) {
                      final String bmi =
                          (selectedWeight / pow(provider.currentHeightMeter, 2))
                              .toStringAsFixed(1);
                      return RichText(
                        text: TextSpan(
                          style: textTheme(context).bodySmall,
                          children: [
                            TextSpan(
                              text: bmi,
                              style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context).primary,
                                  fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(
                                text:
                                    " You have got a great figure! keep it up!"),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            Consumer<OnboardingProvider>(
              builder: (context, provider, child) => CustomAnimatedButton(
                onTap: () {
                  provider.updateCurrentWeight(
                    weight: selectedWeight.toStringAsFixed(1),
                  );
                  provider.updateCurrentWeightText(
                    weightTxt: isKg ? 'kg' : 'lbs',
                  );
                  context.pushNamed(AppRoute.targetWeight);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
