import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class HealthInjuryPage extends StatefulWidget {
  const HealthInjuryPage({super.key});

  @override
  State<HealthInjuryPage> createState() => _HealthInjuryPageState();
}

class _HealthInjuryPageState extends State<HealthInjuryPage> {
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
          child: CustomProgressBar(currentStep: 8, totalSteps: 11),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: colorScheme(context).primary.withOpacity(0.1),
                border: Border.all(
                  color: colorScheme(context).primary,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                "Do you have any health conditions or injuries to consider when training?",
                textAlign: TextAlign.center,
                style: textTheme(context).headlineSmall,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => context.pushNamed(AppRoute.exerciseType),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.no,
                          height: 16,
                        ),
                        const SizedBox(width: 5),
                        Text("No", style: textTheme(context).titleMedium),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () => context.pushNamed(AppRoute.exerciseType),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.yes,
                          height: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Yes",
                          style: textTheme(context).titleMedium,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
