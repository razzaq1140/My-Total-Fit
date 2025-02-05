import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';

class AllExercisesModel {
  String? title;
  String? type;
  String? image;
  Widget? ic;
  Widget? ic2;
  String? subti;
  String? time;
  String? value;
  AllExercisesModel(
      {required this.ic,
      required this.ic2,
      required this.image,
      required this.type,
      required this.subti,
      required this.time,
      required this.title,
      required this.value});
}

List<AllExercisesModel> allExercisesList = [
  AllExercisesModel(
      ic: SvgPicture.asset(AppIcons.calories),
      ic2: SvgPicture.asset(AppIcons.clock1),
      image: AppImages.allex1,
      subti: "135 kcal",
      type: "Cardio",
      time: "30 min",
      title: "Exercises with Jumping \nRope",
      value: "Beginner"),
  AllExercisesModel(
      ic: SvgPicture.asset(AppIcons.calories),
      ic2: SvgPicture.asset(AppIcons.clock1),
      image: AppImages.allex2,
      type: "Back",
      subti: "135 kcal",
      time: "30 min",
      title: "Exercises with Jumping \nRope",
      value: "Beginner"),
  AllExercisesModel(
      ic: SvgPicture.asset(AppIcons.calories),
      ic2: SvgPicture.asset(AppIcons.clock1),
      image: AppImages.allex3,
      type: "Legs",
      subti: "135 kcal",
      time: "30 min",
      title: "Exercises with Jumping \nRope",
      value: "Beginner"),
  AllExercisesModel(
      ic: SvgPicture.asset(AppIcons.calories),
      ic2: SvgPicture.asset(AppIcons.clock1),
      type: "Chest",
      image: AppImages.walking,
      subti: "135 kcal",
      time: "30 min",
      title: "Exercises with Jumping \nRope",
      value: "Beginner"),
  AllExercisesModel(
      ic: SvgPicture.asset(AppIcons.calories),
      ic2: SvgPicture.asset(AppIcons.clock1),
      image: AppImages.sitting,
      type: "cardio",
      subti: "135 kcal",
      time: "30 min",
      title: "Exercises with Jumping \nRope",
      value: "Beginner"),
];
