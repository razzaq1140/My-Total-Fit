import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class WorkoutCompletedPage extends StatefulWidget {
  const WorkoutCompletedPage({super.key});

  @override
  State<WorkoutCompletedPage> createState() => _WorkoutCompletedPageState();
}

class _WorkoutCompletedPageState extends State<WorkoutCompletedPage> {
  int selectedLevel = -1;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    bool isMale = provider.selectedGender == "Male";

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme(context).primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: colorScheme(context).primary,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "WORKOUT COMPLETED!",
                      style: textTheme(context).headlineMedium!.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Image.asset(
                    isMale ? AppImages.homeMale : AppImages.buildMuscle,
                    width: screenWidth * 0.45,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DAY 01",
                    style: textTheme(context).titleLarge,
                  ),
                  Text(
                    "MASSIVE UPPER BODY",
                    style: textTheme(context).labelMedium!.copyWith(
                          color: AppColors.appGrey,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "11",
                            style: textTheme(context)
                                .headlineMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "EXERCISE",
                            style: textTheme(context).bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appGrey,
                                ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "0",
                            style: textTheme(context)
                                .headlineMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "CALORIES",
                            style: textTheme(context).bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appGrey,
                                ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "00:12",
                            style: textTheme(context)
                                .headlineMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "DURATION",
                            style: textTheme(context).bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appGrey,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "How do you feel ?",
                    style: textTheme(context).titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      workoutCompleteFeedbackList.length,
                      (index) {
                        final workoutCompleteFeedback =
                            workoutCompleteFeedbackList[index];
                        return InkWell(
                          overlayColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          onTap: () {
                            setState(() {
                              selectedLevel = index;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: screenWidth * 0.2,
                                height: screenWidth * 0.2,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: selectedLevel == index
                                      ? colorScheme(context).primary
                                      : Colors.grey.shade200,
                                ),
                                child: Image.asset(
                                  workoutCompleteFeedback.image,
                                  width: 33,
                                  height: 33,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                workoutCompleteFeedback.label,
                                style: textTheme(context).labelLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                      onTap: () {
                        context.pushNamed(AppRoute.award);
                      },
                      text: "Finish"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
