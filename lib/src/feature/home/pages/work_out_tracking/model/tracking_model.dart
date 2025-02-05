import 'package:flutter/material.dart';

class WorkoutItem {
  final String title;
  final String value;
  final String unit;
  final Color progressColor;

  WorkoutItem({
    required this.title,
    required this.value,
    required this.unit,
    required this.progressColor,
  });
}

List<WorkoutItem> workoutItems = [
  WorkoutItem(
    title: "Walk",
    value: "2265",
    unit: "Steps",
    progressColor: Colors.orange,
  ),
  WorkoutItem(
    title: "Full Body Workout",
    value: "8:50",
    unit: "Hours",
    progressColor: Colors.blue,
  ),
  WorkoutItem(
    title: "Skipping",
    value: "8:50",
    unit: "Hours",
    progressColor: Colors.red,
  ),
  WorkoutItem(
    title: "Calories",
    value: "399",
    unit: "Kcal",
    progressColor: Colors.orange,
  ),
  WorkoutItem(
    title: "Legs Exercise",
    value: "2265",
    unit: "Steps",
    progressColor: Colors.green,
  ),
  WorkoutItem(
    title: "Sleep",
    value: "8:50",
    unit: "Hours",
    progressColor: Colors.blue,
  ),
];
