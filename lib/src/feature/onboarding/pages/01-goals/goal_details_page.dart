import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/model/goal_details_model.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class GoalDetailsPage extends StatefulWidget {
  const GoalDetailsPage({super.key});

  @override
  State<GoalDetailsPage> createState() => _GoalDetailsPageState();
}

class _GoalDetailsPageState extends State<GoalDetailsPage> {
  double _scale = 0; // Start with 0 for initial scaling
  Offset _offset = const Offset(-1.5, 0);
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Trigger the scale animation after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _scale = 1;
        _offset = Offset.zero;
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    bool isMale = onboardingProvider.selectedGender == "male";
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          child: CustomProgressBar(currentStep: 2, totalSteps: 3),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            AnimatedScale(
              scale: _scale,
              curve: Curves.ease,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                isMale
                    ? goalDetailsListMale[onboardingProvider.fitnessGoalIndex]
                        .image
                    : goalDetailsList[onboardingProvider.fitnessGoalIndex]
                        .image,
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
              ),
            ),
            const SizedBox(height: 30),
            AnimatedSlide(
              offset: _offset,
              duration: const Duration(milliseconds: 500),
              child: Text(
                goalDetailsList[onboardingProvider.fitnessGoalIndex].title,
                style: textTheme(context).titleMedium!.copyWith(
                      color: colorScheme(context).primary,
                    ),
              ),
            ),
            const SizedBox(height: 30),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 700),
              child: Text(
                goalDetailsList[onboardingProvider.fitnessGoalIndex].detail,
                textAlign: TextAlign.center,
                style: textTheme(context).headlineMedium!.copyWith(
                      color: colorScheme(context).outline,
                      fontSize: 20,
                    ),
              ),
            ),
            const SizedBox(height: 40),
            CustomAnimatedButton(
              onTap: () => context.pushNamed(AppRoute.muscle),
            ),
          ],
        ),
      ),
    );
  }
}
