import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthlyDateList extends StatefulWidget {
  const MonthlyDateList({super.key});

  @override
  State<MonthlyDateList> createState() => _MonthlyDateListState();
}

class _MonthlyDateListState extends State<MonthlyDateList> {
  final int currentMonth = DateTime.now().month;

  final int currentYear = DateTime.now().year;

  final int today = DateTime.now().day;
  late int selectedDate;
  @override
  void initState() {
    selectedDate = today;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get the number of days in the current month
    final daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;

    return SizedBox(
      height: 65,
      // padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: daysInMonth,
        itemBuilder: (context, index) {
          // Calculate the date for the current item
          final date = DateTime(currentYear, currentMonth, index + 1);

          // Format the day and weekday
          final day = DateFormat('d').format(date);
          final weekday = DateFormat('EEE').format(date);

          // Check if the date is today
          // final isToday = date.day == today;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = date.day;
              });
              // Handle date selection
              print("Selected Date: $date");
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                    selectedDate == date.day ? Colors.red : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weekday,
                    style: TextStyle(
                      color:
                          selectedDate == date.day ? Colors.white : Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    day,
                    style: TextStyle(
                      color: selectedDate == date.day
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
