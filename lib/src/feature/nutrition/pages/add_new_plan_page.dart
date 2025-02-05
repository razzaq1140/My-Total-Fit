import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_textField.dart';
import 'package:my_total_fit/src/common/widgets/custom_widgets.dart';
import 'package:my_total_fit/src/feature/home/pages/new_work_out/widgets/custom_workout_button.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class AddNewPlanPage extends StatefulWidget {
  const AddNewPlanPage({super.key});

  @override
  State<AddNewPlanPage> createState() => _AddNewPlanPageState();
}

class _AddNewPlanPageState extends State<AddNewPlanPage> {
  TextEditingController mealNameController = TextEditingController();
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

  String selectedCategory = "breakfast";

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Meal Plan"),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Meal plan Name",
                style: textTheme(context).titleSmall,
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: CustomTextFormField(
                  filled: true,
                  validator: (value) =>
                      Validation.fieldValidation(value, "name"),
                  fillColor: Colors.grey.shade100,
                  borderRadius: 5,
                  textStyle: textTheme(context).bodyMedium,
                  controller: mealNameController,
                  hint: "Meal plan name",
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Choose Fitness Level",
                style: textTheme(context)
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              CustomWorkoutButton(
                text: Text("Breakfast", style: textTheme(context).labelLarge),
                borderColor: selectedCategory == "breakfast"
                    ? colorScheme(context).onSecondary
                    : colorScheme(context).onSecondaryContainer,
                onTap: () {
                  setState(() {
                    selectedCategory = "breakfast";
                  });
                },
                color: selectedCategory == "breakfast"
                    ? colorScheme(context).onSecondary
                    : colorScheme(context).onPrimary,
              ),
              const SizedBox(height: 10),
              CustomWorkoutButton(
                text: Text("Lunch", style: textTheme(context).labelLarge),
                borderColor: selectedCategory == "lunch"
                    ? colorScheme(context).onSecondary
                    : colorScheme(context).onSecondaryContainer,
                onTap: () {
                  setState(() {
                    selectedCategory = "lunch";
                  });
                },
                color: selectedCategory == "lunch"
                    ? colorScheme(context).onSecondary
                    : colorScheme(context).onPrimary,
              ),
              const SizedBox(height: 10),
              CustomWorkoutButton(
                text: Text("Dinner", style: textTheme(context).labelLarge),
                borderColor: selectedCategory == "dinner"
                    ? null
                    : colorScheme(context).onSecondaryContainer,
                onTap: () {
                  setState(() {
                    selectedCategory = "dinner";
                  });
                },
                color: selectedCategory == "dinner"
                    ? colorScheme(context).onSecondary
                    : colorScheme(context).onPrimary,
              ),
              const SizedBox(height: 15),
              Text(
                "Meal Plan",
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
                      "Add meal",
                      style: textTheme(context).titleSmall,
                    ),
                  ],
                ),
                onTap: () => context.pushNamed(AppRoute.addMeal),
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
              CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      CustomWidgets.customDialog(
                        title: "Food Added to Log",
                        subtitle: "Congrats  your food has been logged",
                        actionTxt: "View Logged",
                        context: context,
                        onAction: () {
                          Navigator.pop(context);
                          context.pop();
                        },
                      );
                    }
                  },
                  text: 'Create plan'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
