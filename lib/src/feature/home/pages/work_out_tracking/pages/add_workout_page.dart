import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_search_bar.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/controller/workout_controller.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({
    super.key,
  });

  @override
  State<AddWorkoutPage> createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<ImageLabelModel> _selectedWorkout = [];
  List filteredList = [];
  List allWorkout = []; // Store all workouts here.

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<OnboardingProvider>(context, listen: false);
    allWorkout =
        provider.selectedGender == "Male" ? workoutListMale : workoutListFemale;
    filteredList = allWorkout; // Initialize filteredList with allWorkout.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text("Home Exercises"),
        actions: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.cancel_outlined,
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Consumer<WorkoutController>(
          builder: (context, provider, child) => CustomButton(
              onTap: () {
                provider.addWorkoutList(newList: _selectedWorkout);
                context.pop();
              },
              text: "Close"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: colorScheme(context).primary.withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.filter_alt_outlined),
                  Text("All ${filteredList.length}")
                ],
              ),
            ),
            const SizedBox(height: 10),
            CustomSearchBar(
              controller: _searchController,
              onChanged: (query) {
                setState(() {
                  filteredList = allWorkout
                      .where((workout) => workout.label
                          .toLowerCase()
                          .contains(query.trim().toLowerCase()))
                      .toList();
                });
              },
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final list = filteredList[index];
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
                  trailing: Checkbox(
                    shape: const CircleBorder(),
                    side: BorderSide.none,
                    fillColor: _selectedWorkout.contains(list)
                        ? WidgetStatePropertyAll(colorScheme(context).primary)
                        : WidgetStatePropertyAll(Colors.grey.shade300),
                    // activeColor: colorScheme(context).primary,

                    checkColor: Colors.white,
                    value: _selectedWorkout.contains(list),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _selectedWorkout.add(list);
                        } else {
                          _selectedWorkout.remove(list);
                        }
                      });
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
