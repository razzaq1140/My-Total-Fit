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

class WorkoutCreatorPage extends StatefulWidget {
  const WorkoutCreatorPage({super.key});

  @override
  State<WorkoutCreatorPage> createState() => _WorkoutCreatorPageState();
}

class _WorkoutCreatorPageState extends State<WorkoutCreatorPage> {
  double _sliderValue = 20;

  List selectedFocusAreas = [];
  int selectedLevel = -1;
  bool includeWarmUp = false;
  bool includeStretching = true;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    bool isMale = provider.selectedGender == "Male";
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: colorScheme(context).primary.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 230,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CUSTOM",
                        style: textTheme(context)
                            .headlineLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Workout Creator",
                        style: textTheme(context).labelLarge,
                      ),
                    ],
                  )),
                  Expanded(
                    child: Image.asset(
                      isMale ? AppImages.homeMale : AppImages.buildMuscle,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Duration",
                        style: textTheme(context)
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${_sliderValue.toInt()} min",
                        style: textTheme(context).titleMedium,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                    ),
                    child: Slider(
                      inactiveColor: Colors.grey.shade400,
                      value: _sliderValue,
                      min: 0,
                      max: 60,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Focus Area",
                    style: textTheme(context)
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemCount: focusAreaList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            mainAxisExtent: 85),
                    itemBuilder: (context, index) {
                      final focusArea = focusAreaList[index];
                      return InkWell(
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        onTap: () {
                          setState(() {
                            if (selectedFocusAreas.contains(focusArea)) {
                              selectedFocusAreas.remove(focusArea);
                            } else {
                              selectedFocusAreas.add(focusArea);
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedFocusAreas.contains(focusArea)
                                    ? colorScheme(context).primary
                                    : colorScheme(context)
                                        .primary
                                        .withOpacity(0.1),
                              ),
                              child: Image.asset(
                                focusArea.image,
                                width: 40,
                                height: 40,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              focusArea.label,
                              style: textTheme(context).labelLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Level",
                    style: textTheme(context)
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemCount: levelList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            mainAxisExtent: 80),
                    itemBuilder: (context, index) {
                      final level = levelList[index];
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
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedLevel == index
                                    ? colorScheme(context).primary
                                    : colorScheme(context)
                                        .primary
                                        .withOpacity(0.1),
                              ),
                              child: Image.asset(
                                level.image,
                                width: 33,
                                height: 33,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              level.label,
                              style: textTheme(context).labelLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundImage: AssetImage(AppImages.warmUp),
                    ),
                    title: Text(
                      "Includes Warm-up",
                      style: textTheme(context).titleMedium,
                    ),
                    subtitle: Text(
                      "+04:00-6.00  Before workout",
                      style: textTheme(context)
                          .labelMedium!
                          .copyWith(color: AppColors.gary),
                    ),
                    trailing: Switch(
                      value: includeWarmUp,
                      onChanged: (value) {
                        setState(() {
                          includeWarmUp = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundImage: AssetImage(AppImages.stretching),
                    ),
                    title: Text(
                      "Includes Stretching",
                      style: textTheme(context).titleMedium,
                    ),
                    subtitle: Text(
                      "+3:20-4:00  After Workout",
                      style: textTheme(context)
                          .labelMedium!
                          .copyWith(color: AppColors.gary),
                    ),
                    trailing: Switch(
                      value: includeStretching,
                      onChanged: (value) {
                        setState(() {
                          includeStretching = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                      onTap: () {
                        context.pushNamed(AppRoute.createWorkoutProgress);
                      },
                      text: "Create for me"),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      onPressed: () {
                        context.pushNamed(AppRoute.workoutCreatedByMe);
                      },
                      label: Text(
                        "Create by myself",
                        style: textTheme(context).labelLarge,
                      ),
                      iconAlignment: IconAlignment.end,
                      icon: Icon(
                        Icons.arrow_circle_right_rounded,
                        color: colorScheme(context).primary,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
