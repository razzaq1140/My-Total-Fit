import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomDayStreakContent extends StatelessWidget {
  final List<bool> selectedDays;
  final Function(int index, bool value) onDayChanged;

  const CustomDayStreakContent({super.key,
    required this.selectedDays,
    required this.onDayChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Fire icon and streak count
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            SvgPicture.asset(AppIcons.fireColoringIcon,height: 100,),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "01",
                style: textTheme(context).titleLarge?.copyWith(letterSpacing: 0,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Day Streak text
        const Text(
          "Day Streak",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        // Days row with checkboxes inside SingleChildScrollView for horizontal scroll
        Container(
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enables horizontal scroll
            child: Row(
              children: List.generate(selectedDays.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Checkbox(
                        value: selectedDays[index],
                        onChanged: (value) {
                          onDayChanged(index, value!); // Toggle the checkbox state
                        },
                        shape: const CircleBorder(),
                        activeColor: Colors.red,
                      ),
                      Text(
                        ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][index],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Encouraging text
        Text(
          "You’re on fire! Every day matters for hitting your goal!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        const SizedBox(height: 30),
        // Continue button
        SizedBox(
          height: 53,
          width: 290,
          child: ElevatedButton(
            onPressed: () {
              // Example functionality: Show selected days
              final streak = selectedDays.where((day) => day).length;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("You’ve completed $streak day(s) of your streak!"),
                ),
              );
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              backgroundColor: colorScheme(context).primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Continue",
              style: textTheme(context).titleMedium?.copyWith(letterSpacing: 0,color: colorScheme(context).onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}