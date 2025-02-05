import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/onboarding/model/workout_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class EditWorkoutListPage extends StatefulWidget {
  final WorkoutModel workout;
  const EditWorkoutListPage({super.key, required this.workout});

  @override
  State<EditWorkoutListPage> createState() => _EditWorkoutListPageState();
}

class _EditWorkoutListPageState extends State<EditWorkoutListPage> {
  @override
  Widget build(BuildContext context) {
    final workout = widget.workout;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout.category),
        actions: [
          InkWell(
            onTap: () {
              context.pushNamed(AppRoute.addWorkout);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                "Add",
                style: textTheme(context).bodyMedium!.copyWith(
                    color: colorScheme(context).primary,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CustomButton(
            onTap: () {
              MyAppRouter.clearAndNavigate(context, AppRoute.bottomNav);
            },
            text: "Save Start"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${workout.category} (${workout.workoutList.length})",
                  style: textTheme(context)
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme(context).primary.withOpacity(0.06),
                  ),
                  child: Image.asset(
                    AppImages.editWorkout,
                    height: 14,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ReorderableListView.builder(
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex)
                    newIndex--; // Adjust for moving downward
                  final item = workout.workoutList.removeAt(oldIndex);
                  workout.workoutList.insert(newIndex, item);
                });
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              itemCount: workout.workoutList.length,
              itemBuilder: (context, index) {
                final list = workout.workoutList[index];
                return KeyedSubtree(
                  key: ValueKey(list),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          icon: Icons.repeat,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              workout.workoutList.removeAt(index);
                            });
                          },
                          backgroundColor: colorScheme(context).primary,
                          foregroundColor: Colors.white,
                          icon: Icons.delete_outline,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.menu),
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
                            subtitle: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colorScheme(context)
                                          .primary
                                          .withOpacity(0.1),
                                    ),
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        color: colorScheme(context).primary,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  list.description!,
                                  style:
                                      textTheme(context).bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.gary,
                                          ),
                                ),
                                const SizedBox(width: 4),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colorScheme(context)
                                          .primary
                                          .withOpacity(0.1),
                                    ),
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        color: colorScheme(context).primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_horiz),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              onTap: () {
                context.pushNamed(AppRoute.addWorkout);
              },
              text: "+ Add Exercise",
              color: colorScheme(context).primary.withOpacity(0.1),
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
