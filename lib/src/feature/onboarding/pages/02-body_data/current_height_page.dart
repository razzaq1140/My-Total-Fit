import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';

import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class CurrentHeightPage extends StatefulWidget {
  const CurrentHeightPage({super.key});

  @override
  _CurrentHeightPageState createState() => _CurrentHeightPageState();
}

class _CurrentHeightPageState extends State<CurrentHeightPage> {
  final RulerPickerController _rulerPickerController =
      RulerPickerController(value: 157.0);
  bool isCm = true;
  double selectedHeight = 157.0;
  // num currentValue = 157;

  List<RulerRange> ranges = const [
    RulerRange(begin: 0, end: 250, scale: 1),
  ];

  void selectFt() {
    setState(() {
      if (isCm) {
        isCm = false;
        selectedHeight /= 30.48;
        _rulerPickerController.value = selectedHeight;
      }
    });
  }

  void selectCm() {
    setState(() {
      if (!isCm) {
        isCm = true;
        selectedHeight *= 30.48;
        _rulerPickerController.value = selectedHeight;
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
          child: CustomProgressBar(currentStep: 3, totalSteps: 10),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
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
                  const TextSpan(text: " height?"),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: colorScheme(context).primary),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: selectFt,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: !isCm
                                      ? colorScheme(context).primary
                                      : colorScheme(context).onPrimary,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Text(
                                  'Ft',
                                  style: textTheme(context)
                                      .labelLarge
                                      ?.copyWith(
                                          color: !isCm
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context).primary),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: selectCm,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isCm
                                      ? colorScheme(context).primary
                                      : colorScheme(context).onPrimary,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Text(
                                  'Cm',
                                  style: textTheme(context)
                                      .labelLarge
                                      ?.copyWith(
                                          color: isCm
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context).primary),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${selectedHeight.toStringAsFixed(1)} ${isCm ? 'cm' : 'ft'}',
                        style: textTheme(context).headlineLarge,
                      )
                    ],
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: RulerPicker(
                    controller: _rulerPickerController,
                    ranges: ranges,
                    onBuildRulerScaleText: (index, value) {
                      return value.toInt().toString();
                    },
                    rulerScaleTextStyle: const TextStyle(color: Colors.black),
                    width: 300,
                    height: 70,
                    rulerMarginTop: 10,
                    marker: Container(
                      width: 2,
                      height: 50,
                      color: colorScheme(context).primary,
                    ),
                    onValueChanged: (value) {
                      setState(() {
                        // selectedHeight = isCm
                        //     ? value.toDouble().clamp(140, 200)
                        //     : (value.toDouble() * 30.48).clamp(
                        //         140, 200); // Converts to cm if in feet mode

                        selectedHeight = value.toDouble();
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            Consumer<OnboardingProvider>(
              builder: (context, provider, child) => CustomAnimatedButton(
                onTap: () {
                  provider.updateCurrentHeight(
                    height: selectedHeight.toStringAsFixed(1),
                  );
                  provider.updateCurrentHeightText(
                    heightText: isCm ? 'cm' : 'ft',
                  );
                  if (isCm) {
                    provider.updateCurrentHeightMeter(
                        heightMeter: selectedHeight / 100);
                  } else {
                    provider.updateCurrentHeightMeter(
                        heightMeter: double.parse(
                            (selectedHeight / 3.281).toStringAsFixed(1)));
                  }
                  context.pushNamed(AppRoute.currentWeight);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
