import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class GoalsSelectionPage extends StatefulWidget {
  const GoalsSelectionPage({super.key});

  @override
  State<GoalsSelectionPage> createState() => _GoalsSelectionPageState();
}

class _GoalsSelectionPageState extends State<GoalsSelectionPage> {
  int selectedIndex = -1;
  Offset _offset = const Offset(0, 0.5);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          _offset = Offset.zero;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);

    final screenWidth = MediaQuery.of(context).size.width;

    bool isMale = onboardingProvider.selectedGender == "male" ? true : false;

    print(onboardingProvider.selectedGender);

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
          child: CustomProgressBar(currentStep: 1, totalSteps: 3),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: textTheme(context)
                    .headlineSmall
                    ?.copyWith(color: Colors.black),
                children: [
                  const TextSpan(text: "What is your main "),
                  TextSpan(
                    text: "fitness goal",
                    style: TextStyle(color: colorScheme(context).primary),
                  ),
                  const TextSpan(text: "?"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            GridView.builder(
              shrinkWrap: true,
              itemCount: isMale
                  ? goalsSelectionListMale.length
                  : goalsSelectionListFemale.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: screenWidth * 0.6,
              ),
              itemBuilder: (context, index) {
                final goal = isMale
                    ? goalsSelectionListMale[index]
                    : goalsSelectionListFemale[index];

                final delay = Duration(milliseconds: 300 * index);

                return AnimatedSlide(
                  offset: _offset,
                  duration: delay,
                  curve: Curves.linear,
                  child: InkWell(
                    overlayColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                    onTap: () {
                      onboardingProvider.updateGoalIndex(goalIndex: index);
                      selectedIndex = index;
                      Future.delayed(const Duration(milliseconds: 250), () {
                        context.pushNamed(AppRoute.goalsDetails);
                      });
                    },
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: screenWidth * 0.6,
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? colorScheme(context)
                                      .primary
                                      .withOpacity(0.07)
                                  : Colors.transparent,
                              border: Border.all(
                                color: selectedIndex == index
                                    ? colorScheme(context).primary
                                    : Colors.grey.shade200,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                selectedIndex == index
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  colorScheme(context).primary,
                                              shape: BoxShape.circle),
                                          padding: const EdgeInsets.all(3),
                                          child: const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(height: 18),
                                Expanded(
                                  child: Image.asset(
                                    goal.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                FittedBox(
                                  child: Text(
                                    goal.label,
                                    style: textTheme(context).titleMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
