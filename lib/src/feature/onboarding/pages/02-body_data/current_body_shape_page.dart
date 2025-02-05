import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class CurrentBodyShapePage extends StatefulWidget {
  const CurrentBodyShapePage({super.key});

  @override
  State<CurrentBodyShapePage> createState() => _CurrentBodyShapePageState();
}

class _CurrentBodyShapePageState extends State<CurrentBodyShapePage> {
  double _currentValue = 15;

  int selectedIndex = 2;

  List<String> bodyMaleList = [
    AppImages.bodyMale1,
    AppImages.bodyMale2,
    AppImages.bodyMale3,
    AppImages.bodyMale4,
    AppImages.bodyMale5,
    AppImages.bodyMale6,
  ];

  List<String> bodyFemaleList = [
    AppImages.bodyFemle1,
    AppImages.bodyFemle2,
    AppImages.bodyFemle3,
    AppImages.bodyFemle4,
    AppImages.bodyFemle5,
    AppImages.bodyFemle6,
  ];
  double height = 50;
  double padding = 0;

  @override
  Widget build(BuildContext context) {
    int roundedValue = _currentValue.toInt();
    switch (roundedValue) {
      case 15:
        selectedIndex = 0;
      case 20:
        selectedIndex = 1;
        break;
      case 25:
        selectedIndex = 2;
        break;
      case 30:
        selectedIndex = 3;
        break;
      case 35:
        selectedIndex = 4;
        break;
      case 40:
        selectedIndex = 5;
        break;

      default:
        selectedIndex = 2;
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
          child: CustomProgressBar(currentStep: 1, totalSteps: 10),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      text: "Current",
                      style: TextStyle(color: colorScheme(context).primary),
                    ),
                    const TextSpan(text: " body shape*?"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Consumer<OnboardingProvider>(
                builder: (context, provider, child) => Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(provider.selectedGender == "male"
                          ? bodyMaleList[selectedIndex]
                          : bodyFemaleList[selectedIndex]),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.grey.shade100,
                    inactiveTrackColor: Colors.grey.shade100,
                    thumbColor: colorScheme(context).primary,
                    overlayColor: colorScheme(context).onPrimary,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 24.0),
                    activeTickMarkColor:
                        colorScheme(context).primary.withOpacity(0.3),
                    inactiveTickMarkColor:
                        colorScheme(context).primary.withOpacity(0.4),
                    tickMarkShape:
                        const RoundSliderTickMarkShape(tickMarkRadius: 5.0),
                  ),
                  child: Slider(
                    value: _currentValue,
                    min: 15,
                    max: 40,
                    divisions: 5,
                    onChanged: (value) {
                      setState(() {
                        _currentValue = value;
                        print(_currentValue);
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('15%',
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: AppColors.gary)),
                    Text('20%',
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: AppColors.gary)),
                    Text('25%',
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: AppColors.gary)),
                    Text('30%',
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: AppColors.gary)),
                    Text('35%',
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: AppColors.gary)),
                    Text('40%',
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: AppColors.gary)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Consumer<OnboardingProvider>(
                builder: (context, provider, child) => CustomAnimatedButton(
                  onTap: () {
                    context.pushNamed(AppRoute.desiredBodyShape);
                    provider.updateBodyShape(
                      bodyShape: provider.selectedGender == "male"
                          ? bodyMaleList[selectedIndex]
                          : bodyFemaleList[selectedIndex],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
