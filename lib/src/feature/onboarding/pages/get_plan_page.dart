import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/feature/onboarding/widgets/monthly_date_grid.dart';
import 'package:my_total_fit/src/feature/onboarding/widgets/sf_modules_graph.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class GetPlanPage extends StatefulWidget {
  const GetPlanPage({super.key});

  @override
  State<GetPlanPage> createState() => _GetPlanPageState();
}

class _GetPlanPageState extends State<GetPlanPage> {
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    bool isMale = provider.selectedGender == "male";
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
          child: CustomProgressBar(currentStep: 11, totalSteps: 11),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Based on your answers, you will be",
                style: textTheme(context).bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
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
            ),
            const SizedBox(height: 40),
            const SizedBox(height: 200, child: SfModulesGraph()),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: textTheme(context).bodyMedium,
                children: const [
                  TextSpan(
                    text: "90%",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " of users like you have successfully lost ",
                  ),
                  TextSpan(
                    text: "30kg",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " with our plan"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Workout Routines",
              style: textTheme(context)
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const MonthlyDateGrid(),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Design for you",
                        style: textTheme(context)
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: planDesignList.length,
                        itemBuilder: (context, index) {
                          final plan = planDesignList[index];
                          return ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              foregroundImage: AssetImage(plan.image),
                            ),
                            title: Text(plan.label),
                            subtitle: Text(
                              plan.description!,
                              style: textTheme(context).titleMedium,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Consumer<OnboardingProvider>(
                  builder: (context, value, child) => Expanded(
                    flex: 1,
                    child: Image.asset(
                      value.desiredBodyShape,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Key Exercises Preview",
              style: textTheme(context).titleSmall,
            ),
            const SizedBox(height: 10),
            Text(
              "Week 1 full body Activation",
              style: textTheme(context)
                  .titleMedium!
                  .copyWith(color: colorScheme(context).primary),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: isMale
                    ? bodyActivationExerciseListMale.length
                    : bodyActivationExerciseList.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final bodyActivation = isMale
                      ? bodyActivationExerciseListMale[index]
                      : bodyActivationExerciseList[index];
                  return Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Image.asset(
                            bodyActivation.image,
                            width: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(bodyActivation.label,
                              style: textTheme(context).headlineSmall),
                          const SizedBox(width: 6),
                          Text(bodyActivation.description!,
                              style: textTheme(context).labelSmall),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Week 2 Personalized Weight loss",
              style: textTheme(context)
                  .titleMedium!
                  .copyWith(color: colorScheme(context).primary),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: isMale
                    ? weightLossExerciseListMale.length
                    : weightLossExerciseList.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final weightLoss = isMale
                      ? weightLossExerciseListMale[index]
                      : weightLossExerciseList[index];
                  return Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Image.asset(
                            weightLoss.image,
                            width: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(weightLoss.label,
                              style: textTheme(context).headlineSmall),
                          const SizedBox(width: 6),
                          Text(weightLoss.description!,
                              style: textTheme(context).labelSmall),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.subscriptions, extra: false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
