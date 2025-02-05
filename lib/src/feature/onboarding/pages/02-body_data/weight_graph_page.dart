import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/feature/onboarding/widgets/sf_modules_graph.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class WeightGraphPage extends StatefulWidget {
  const WeightGraphPage({super.key});

  @override
  State<WeightGraphPage> createState() => _WeightGraphPageState();
}

class _WeightGraphPageState extends State<WeightGraphPage> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime nextMonthDate = DateTime(now.year, now.month + 1, now.day);
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
          child: CustomProgressBar(currentStep: 10, totalSteps: 10),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text("In your case, you’ll most likely reach",
                style: textTheme(context).titleSmall?.copyWith(
                    fontWeight: FontWeight.w400, color: Colors.grey)),
            const SizedBox(height: 5),
            Consumer<OnboardingProvider>(
              builder: (context, provider, child) {
                final String targetWeight = provider.targetWeight;

                return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: textTheme(context)
                        .headlineSmall
                        ?.copyWith(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "$targetWeight ${provider.targetWeightText}",
                        style: TextStyle(color: colorScheme(context).primary),
                      ),
                      const TextSpan(text: " by "),
                      TextSpan(
                        text: "${DateFormat("MMM d").format(nextMonthDate)}!",
                        style: TextStyle(color: colorScheme(context).primary),
                      ),
                    ],
                  ),
                );
              },
            ), // Changed color to red for emphasis
            const SizedBox(height: 40),
            // const SfModulesGraph(),
            Container(
              padding: const EdgeInsets.only(top: 5),
              height: 250,
              width: double.infinity,
              child: const SfModulesGraph(),
            ),
            const SizedBox(height: 20),
            Text(
              "A Great Start!",
              textAlign: TextAlign.center,
              style: textTheme(context).headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              "Everything is going as expected!\nwe’ll give you a more precise date after a few more question",
              textAlign: TextAlign.center,
              style: textTheme(context)
                  .titleSmall
                  ?.copyWith(color: AppColors.gary),
            ),
            const SizedBox(height: 40),
            CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.aboutYouAnimation);
              },
            )
          ],
        ),
      ),
    );
  }
}
