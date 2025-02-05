import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/feature/onboarding/widgets/progress_indicator_onboarding.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class AwardingPlanScreen extends StatefulWidget {
  const AwardingPlanScreen({super.key});

  @override
  _AwardingPlanScreenState createState() => _AwardingPlanScreenState();
}

class _AwardingPlanScreenState extends State<AwardingPlanScreen> {
  double progressPercent = 0.98;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      context.pushReplacementNamed(AppRoute.signInPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    bool isMale = provider.selectedGender == 'male';

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Create your plan...",
                style: textTheme(context).headlineSmall,
                textAlign: TextAlign.center,
              ),
              ProgressIndicatorOnboarding(
                progressPercent: progressPercent,
              ),
              Text(
                isMale
                    ? "No.1 Rated Men Fitness App"
                    : "No.1 Rated Women Fitness App",
                style: textTheme(context).headlineMedium?.copyWith(
                    color: colorScheme(context).primary,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                AppImages.medal2,
                width: screenWidth * 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
