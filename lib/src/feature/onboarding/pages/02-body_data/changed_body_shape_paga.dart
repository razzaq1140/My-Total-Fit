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

class ChangedBodyShapePaga extends StatefulWidget {
  const ChangedBodyShapePaga({super.key});

  @override
  State<ChangedBodyShapePaga> createState() => _ChangedBodyShapePagaState();
}

class _ChangedBodyShapePagaState extends State<ChangedBodyShapePaga> {
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
          child: CustomProgressBar(currentStep: 7, totalSteps: 10),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                  const TextSpan(text: "See "),
                  TextSpan(
                    text: "Amazing",
                    style: TextStyle(color: colorScheme(context).primary),
                  ),
                  const TextSpan(text: " changes after hitting your goals!"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Consumer<OnboardingProvider>(
              builder: (context, provider, child) => Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 207,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Consumer<OnboardingProvider>(
                                  builder: (context, provider, child) =>
                                      Image.asset(
                                    provider.currentBodyShape,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: colorScheme(context).outline,
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                "${provider.currentWeight} ${provider.currentWeightText}",
                                style: textTheme(context)
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 247,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade200),
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                ),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Consumer<OnboardingProvider>(
                                      builder: (context, provider, child) =>
                                          Image.asset(
                                        provider.desiredBodyShape,
                                        fit: BoxFit.cover,
                                      ),
                                    ))),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: colorScheme(context).primary,
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                "${provider.targetWeight} ${provider.targetWeightText}",
                                style: textTheme(context)
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: 150, child: LottieBuilder.asset(AppAnimations.joy)),
            const SizedBox(height: 30),
            CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.injuryOptions);
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
