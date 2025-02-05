import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class ChallengeWorkoutPage extends StatelessWidget {
  const ChallengeWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    bool isMale = provider.selectedGender == "Male";

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: colorScheme(context).primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: colorScheme(context).primary,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Full Body Workout",
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("0/28 Days Finished"),
                        Text("0%"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.0,
                      minHeight: 10,
                      color: Colors.red,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme(context).primary,
                          ),
                          child: Text(
                            "01",
                            style: textTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Week 01",
                          style: textTheme(context)
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          // Days Grid
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 8, // Total days
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, // Number of columns
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1.5,
                            ),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: index == 0
                                        ? Colors.red
                                        : Colors.grey.shade500,
                                    child: index == 7
                                        ? const Icon(
                                            Icons.emoji_events,
                                            color: Colors.white,
                                          )
                                        : Text(
                                            "0${index + 1}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                  if ((index + 1) % 4 != 0)
                                    // Arrow between the circles
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          // Start Button
                          CustomButton(
                            onTap: () {
                              context.pushNamed(AppRoute.ready);
                            },
                            text: "Start",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme(context).primary,
                          ),
                          child: Text(
                            "02",
                            style: textTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Week 02",
                          style: textTheme(context)
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          // Days Grid
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 8, // Total days
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, // Number of columns
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1.5,
                            ),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: index == 0
                                        ? Colors.red
                                        : Colors.grey.shade500,
                                    child: index == 7
                                        ? const Icon(
                                            Icons.emoji_events,
                                            color: Colors.white,
                                          )
                                        : Text(
                                            "0${index + 1}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                  if ((index + 1) % 4 != 0)
                                    // Arrow between the circles
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
