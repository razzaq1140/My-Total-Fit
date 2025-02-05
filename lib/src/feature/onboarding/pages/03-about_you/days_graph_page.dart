import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:my_total_fit/src/common/constents/app_animations.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class DaysGraphPage extends StatefulWidget {
  const DaysGraphPage({super.key});

  @override
  State<DaysGraphPage> createState() => _DaysGraphPageState();
}

class _DaysGraphPageState extends State<DaysGraphPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    bool isMale = provider.selectedGender == "Male";

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
          child: CustomProgressBar(currentStep: 2, totalSteps: 11),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: textTheme(context)
                    .headlineSmall
                    ?.copyWith(color: colorScheme(context).primary),
                children: const [
                  TextSpan(text: "See the "),
                  TextSpan(
                      text: "amazing", style: TextStyle(color: Colors.black)),
                  TextSpan(text: " changes after hitting your goal!"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Lottie.asset(
              AppAnimations.graph,
              repeat: false,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 40),
            Consumer<OnboardingProvider>(
              builder: (context, value, child) {
                bool isMale = value.selectedGender == "male";
                return Text(
                  "Based on our historical data for ${isMale ? "men" : "women"} in their 20s, weight loss is usually delayed at first, but after 7 days you can burn calories like crazy!",
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(color: AppColors.appGrey),
                  textAlign: TextAlign.center,
                );
              },
            ),
            // Text(
            //     "Based on our historical data for women in their 20s, weight loss is usually delayed at first, but after 7 days you can burn calories like crazy!",
            //     style: textTheme(context)
            //         .bodyMedium
            //         ?.copyWith(color: AppColors.appGrey),
            //     textAlign: TextAlign.center,
            //   ),
            const SizedBox(height: 40),
            CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.fitnessLevel);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _bottomTitleWidgets(double value) {
    switch (value.toInt()) {
      case 0:
        return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('Day 1', style: textTheme(context).bodySmall));

      case 3:
        return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('Day 7', style: textTheme(context).bodySmall));
      default:
        return Container();
    }
  }
}
