import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_textField.dart';
import 'package:my_total_fit/src/common/widgets/custom_widgets.dart';
import 'package:my_total_fit/src/feature/home/pages/new_work_out/widgets/custom_workout_button.dart';

class CreateGoalPage extends StatefulWidget {
  const CreateGoalPage({super.key});

  @override
  State<CreateGoalPage> createState() => _CreateGoalPageState();
}

class _CreateGoalPageState extends State<CreateGoalPage> {
  final TextEditingController _goalNameController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      firstDate: DateTime(1900),
      initialDate: selectedDate,
      lastDate: DateTime(2100),
      context: context,
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  String selectedCategory = "Begineer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Goal",
          style: textTheme(context).headlineLarge?.copyWith(
                color: colorScheme(context).onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Goal Name",
              style: textTheme(context).titleSmall,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: CustomTextFormField(
                controller: _goalNameController,
                filled: true,
                fillColor: Colors.grey.shade100,
                borderRadius: 5,
                textStyle: textTheme(context).bodyMedium,
                hint: "Full Body Workout",
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Choose Goal",
              style: textTheme(context)
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            CustomWorkoutButton(
              text: Text("Begineer", style: textTheme(context).labelLarge),
              borderColor: selectedCategory == "Begineer"
                  ? colorScheme(context).onSecondary
                  : colorScheme(context).onSecondaryContainer,
              onTap: () {
                setState(() {
                  selectedCategory = "Begineer";
                });
              },
              color: selectedCategory == "Begineer"
                  ? colorScheme(context).onSecondary
                  : colorScheme(context).onPrimary,
            ),
            const SizedBox(height: 10),
            CustomWorkoutButton(
              text: Text("Intermediate", style: textTheme(context).labelLarge),
              borderColor: selectedCategory == "Intermediate"
                  ? colorScheme(context).onSecondary
                  : colorScheme(context).onSecondaryContainer,
              onTap: () {
                setState(() {
                  selectedCategory = "Intermediate";
                });
              },
              color: selectedCategory == "Intermediate"
                  ? colorScheme(context).onSecondary
                  : colorScheme(context).onPrimary,
            ),
            const SizedBox(height: 10),
            CustomWorkoutButton(
              text: Text("Advance", style: textTheme(context).labelLarge),
              borderColor: selectedCategory == "Advance"
                  ? null
                  : colorScheme(context).onSecondaryContainer,
              onTap: () {
                setState(() {
                  selectedCategory = "Advance";
                });
              },
              color: selectedCategory == "Advance"
                  ? colorScheme(context).onSecondary
                  : colorScheme(context).onPrimary,
            ),
            const SizedBox(height: 15),
            Text(
              "Add Goal Exercises",
              style: textTheme(context)
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomWorkoutButton(
              text: Row(
                children: [
                  const Icon(
                    Icons.add,
                    size: 18,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    "Add Exercises",
                    style: textTheme(context).titleSmall,
                  ),
                ],
              ),
              onTap: () {},
              color: colorScheme(context).onSecondary,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectTime(context),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      "Time",
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Row(
                        children: [
                          Text(
                            selectedTime.format(context),
                            style: textTheme(context).bodyMedium,
                          ),
                          const Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      "Date",
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Row(
                        children: [
                          Text(
                            DateFormat("dd/M/yyyy").format(selectedDate),
                            style: textTheme(context).bodyMedium,
                          ),
                          const Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 45,
              child: CustomButton(
                textSize: 18,
                onTap: () {
                  if (_goalNameController.text.isNotEmpty) {
                    // Show a dialog after setting goal data
                    CustomWidgets.customDialog(
                      title: "Goal Created",
                      subtitle: "Congrats, your goal has been created!",
                      actionTxt: "View Goal",
                      context: context,
                      onAction: () {
                        Navigator.pop(context); // Close dialog
                        Navigator.pop(context, _goalNameController.text);
                      },
                    );
                  }
                },
                text: 'Create Goal',
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
