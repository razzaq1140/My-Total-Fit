import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_textField.dart';
import 'package:my_total_fit/src/feature/home/pages/new_work_out/widgets/custom_workout_button.dart';
import 'package:flutter/material.dart';

class NewworkoutScreen extends StatefulWidget {
  const NewworkoutScreen({super.key});

  @override
  State<NewworkoutScreen> createState() => _NewworkoutScreenState();
}

class _NewworkoutScreenState extends State<NewworkoutScreen> {
  TextEditingController controller = TextEditingController();
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

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Workout"),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Workout Name",
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                CustomTextFormField(
                    borderColor: AppColors.appGrey,
                    borderRadius: 5,
                    validator: (value) =>
                        Validation.fieldValidation(value, "name"),
                    textStyle: textTheme(context).bodyMedium,
                    controller: controller,
                    hint: "Workout name",
                    hintSize: 12),
                const SizedBox(height: 10),
                Text(
                  "Choose Fitness Level",
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomWorkoutButton(
                  text: Text("Beginner", style: textTheme(context).bodyMedium),
                  onTap: () {},
                  color: colorScheme(context).onSecondary,
                ),
                const SizedBox(height: 10),
                CustomWorkoutButton(
                  text: Text("Intermediate",
                      style: textTheme(context).bodyMedium),
                  onTap: () {},
                  color: colorScheme(context).onPrimary,
                ),
                const SizedBox(height: 10),
                CustomWorkoutButton(
                  text: Text("Advanced", style: textTheme(context).bodyMedium),
                  onTap: () {},
                  color: colorScheme(context).onPrimary,
                ),
                const SizedBox(height: 10),
                Text(
                  "Workout",
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomWorkoutButton(
                  text: Row(
                    children: [
                      const Icon(Icons.add),
                      const SizedBox(width: 10),
                      Text("Add Exercises",
                          style: textTheme(context).bodyMedium),
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
                          "Time: ",
                          style: textTheme(context)
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          selectedTime.format(context),
                          style: textTheme(context).bodyMedium,
                        ),
                        const Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (controller.text.isNotEmpty) {
                          context.pop();
                        }
                      }
                    },
                    text: 'Create workout'),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
