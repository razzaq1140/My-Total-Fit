import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/onboarding/model/workout_model.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class WorkoutListPage extends StatefulWidget {
  const WorkoutListPage({super.key});

  @override
  State<WorkoutListPage> createState() => _WorkoutListPageState();
}

class _WorkoutListPageState extends State<WorkoutListPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    final List<WorkoutModel> allWorkout = provider.selectedGender == "Male"
        ? allWorkoutListMale
        : allWorkoutListFemale;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Full Body Beginner 1",
          style: textTheme(context)
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        color: Colors.white,
        child: CustomButton(
          onTap: () {
            MyAppRouter.clearAndNavigate(context, AppRoute.bottomNav);
          },
          text: "Save Start",
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "22",
                      style: textTheme(context)
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Exercises",
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
                      "18",
                      style: textTheme(context)
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Time",
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
                      "394 kcl",
                      style: textTheme(context)
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Calorie",
                      style: textTheme(context).bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.appGrey,
                          ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Equipment",
                  style: textTheme(context)
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Chip(
                  backgroundColor:
                      colorScheme(context).primary.withOpacity(0.06),
                  padding: const EdgeInsets.all(8),
                  avatar: Image.asset(
                    AppImages.wall,
                    height: 20,
                  ),
                  label: const Text(
                    "Wall",
                    style: TextStyle(
                      // color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                const SizedBox(width: 8),
                Chip(
                  backgroundColor:
                      colorScheme(context).primary.withOpacity(0.06),
                  padding: const EdgeInsets.all(8),
                  avatar: Image.asset(
                    AppImages.chair,
                    height: 20,
                  ),
                  label: const Text(
                    "Chair",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ListView.separated(
              shrinkWrap: true,
              itemCount: allWorkout.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final workout = allWorkout[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () => context.pushNamed(
                        AppRoute.editWorkoutList,
                        extra: workout,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${workout.category} (${workout.workoutList.length})",
                            style: textTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorScheme(context)
                                  .primary
                                  .withOpacity(0.06),
                            ),
                            child: Image.asset(
                              AppImages.editWorkout,
                              height: 14,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      itemCount: workout.workoutList.length,
                      itemBuilder: (context, index) {
                        final list = workout.workoutList[index];
                        return Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 2,
                                  color: AppColors.appGrey,
                                ),
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red, // Red dot
                                  ),
                                ),
                                Container(
                                  width: 2,
                                  color: AppColors.appGrey, // Bottom gray line
                                ),
                              ],
                            ),
                            Expanded(
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(width: 16),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        list.image,
                                        height: 85,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  list.label,
                                  style: textTheme(context)
                                      .bodyMedium!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  list.description!,
                                  style:
                                      textTheme(context).bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.gary,
                                          ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
      )),
    );
  }
}
