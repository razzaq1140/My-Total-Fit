import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/home/pages/exercise_details.dart/model/exercise_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final ExerciseModel exercise;

  const ExerciseDetailScreen({super.key, required this.exercise});

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercise = widget.exercise;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(exercise.image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Level",
                                style: textTheme(context).labelSmall,
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4))),
                                child: Text(
                                  "Beginner",
                                  textAlign: TextAlign.center,
                                  style: textTheme(context).labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Category",
                                style: textTheme(context).labelSmall,
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4))),
                                child: Text(
                                  "Cardio",
                                  textAlign: TextAlign.center,
                                  style: textTheme(context).labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Weight",
                                style: textTheme(context).labelSmall,
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4))),
                                child: Text(
                                  "Lose",
                                  textAlign: TextAlign.center,
                                  style: textTheme(context).labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(exercise.title!,
                        style: textTheme(context)
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      exercise.details!,
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(color: AppColors.appGrey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      exercise.date!,
                      style: textTheme(context).labelLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Exercise Program",
                      style: textTheme(context)
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: colorScheme(context).primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelColor: colorScheme(context).onPrimary,
                      unselectedLabelColor: colorScheme(context).onSurface,
                      tabs: const [
                        Tab(
                          text: "Cardio",
                          iconMargin: EdgeInsets.all(10),
                        ),
                        Tab(text: "Legs"),
                        Tab(text: "Back"),
                        Tab(text: "Chest"),
                      ],
                      dividerColor: colorScheme(context).onPrimary,
                      labelStyle: textTheme(context).bodyMedium,
                      indicatorPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    SizedBox(
                      height: 200,
                      child: TabBarView(controller: _tabController, children: [
                        _buildExerciseList(context, "Cardio"),
                        _buildExerciseList(context, "Legs"),
                        _buildExerciseList(context, "Back"),
                        _buildExerciseList(context, "Chest"),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: CustomButton(
                          onTap: () {
                            context.pushNamed(AppRoute.startExercise);
                          },
                          text: "Start"),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 220, left: 20),
                  height: 90,
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: colorScheme(context).onPrimary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.calories,
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        exercise.kcl!,
                        style: textTheme(context).labelMedium,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "|",
                        style: textTheme(context).labelMedium,
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        AppIcons.clock1,
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        exercise.time!,
                        style: textTheme(context).labelMedium,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseList(context, String type) {
    final filteredList =
        exerciseList.where((exercise) => exercise.type == type).toList();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: filteredList.map((exercise) {
          return Column(
            children: [
              _buildExerciseItem(context, exercise.title!, exercise.kcl!,
                  exercise.time!, exercise.level!, exercise.exerciseimage!),
              const SizedBox(height: 8),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildExerciseItem(BuildContext context, String title, String calories,
      String time, String level, String image) {
    return Row(
      children: [
        Container(
          width: 90,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.appGrey,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: textTheme(context)
                      .labelMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.calories),
                  const SizedBox(width: 10),
                  Text(
                    calories,
                    style: textTheme(context).labelSmall,
                  ),
                  const SizedBox(width: 16),
                  SvgPicture.asset(AppIcons.clock1),
                  const SizedBox(width: 10),
                  Text(time, style: textTheme(context).labelSmall),
                ],
              ),
              const SizedBox(height: 10),
              Text(level,
                  style: textTheme(context)
                      .labelSmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
