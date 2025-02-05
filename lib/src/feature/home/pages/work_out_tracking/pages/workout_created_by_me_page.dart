import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/utils/custom_snackbar.dart';
import 'package:my_total_fit/src/common/widgets/custom_textField.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/controller/workout_controller.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class WorkoutCreatedByMePage extends StatefulWidget {
  const WorkoutCreatedByMePage({super.key});

  @override
  State<WorkoutCreatedByMePage> createState() => _WorkoutCreatedByMePageState();
}

class _WorkoutCreatedByMePageState extends State<WorkoutCreatedByMePage> {
  String workoutName = "My Workout";
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    _nameController.text = workoutName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WorkoutController>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            provider.clearWorkoutList();
            context.pop();
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Cancel",
                style: textTheme(context).bodyMedium!.copyWith(
                    color: Colors.grey.shade500, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        title: const Text("Create by my self"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              if (provider.newWorkoutList.isEmpty) {
                showSnackbar(message: "please add exercises", isError: true);
              } else {
                provider.clearWorkoutList();
                context.pop();
              }
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Edit mode",
              style: textTheme(context).labelMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme(context).primary),
            ),
            Row(
              children: [
                Text(
                  workoutName,
                  style: textTheme(context).titleMedium,
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    _editNameDialog();
                  },
                  child: Container(
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
                )
              ],
            ),
            const SizedBox(height: 2),
            Text(
              "My custom workout",
              style: textTheme(context).bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              "Exercises (${provider.newWorkoutList.length})",
              style: textTheme(context)
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                context.pushNamed(AppRoute.addWorkout);
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: colorScheme(context).primary,
                        shape: BoxShape.circle),
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Add Exercise here",
                    style: textTheme(context).bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              itemCount: provider.newWorkoutList.length,
              itemBuilder: (context, index) {
                final list = provider.newWorkoutList[index];
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      list.image,
                      height: 85,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    list.label,
                    style: textTheme(context)
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset(
                        AppImages.homeFire,
                        height: 15,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Popular",
                        style: textTheme(context).bodyMedium,
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  _editNameDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsPadding: const EdgeInsets.all(0),
        title: Text(
          "Please enter name your plan",
          style: textTheme(context).titleMedium,
        ),
        content: CustomTextFormField(
          borderColor: Colors.grey.shade100,
          controller: _nameController,
          borderRadius: 50,
          hint: "Enter Plan Name",
        ),
        actions: [
          const Divider(height: 0),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      "Cancel",
                      textAlign: TextAlign.center,
                      style: textTheme(context).bodyMedium!.copyWith(
                            color: colorScheme(context).primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        workoutName = _nameController.text.trim();
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Ok",
                      textAlign: TextAlign.center,
                      style: textTheme(context).bodyMedium!.copyWith(
                            color: colorScheme(context).primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
