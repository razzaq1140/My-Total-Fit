import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:flutter/material.dart';

class TodayMealNutritionModel {
  final String title;
  final String image;
  final String value;
  final double percentage;
  final Color color;

  TodayMealNutritionModel({
    required this.title,
    required this.image,
    required this.value,
    required this.percentage,
    required this.color,
  });
}

List<TodayMealNutritionModel> todayMealNutritionList = [
  TodayMealNutritionModel(
    title: "Calories",
    image: AppImages.fireRed,
    value: "320 kCal",
    percentage: 0.7,
    color: AppColors.blue,
  ),
  TodayMealNutritionModel(
    title: "Proteins",
    image: AppImages.protiens,
    value: "300g",
    percentage: 0.5,
    color: AppColors.pink,
  ),
  TodayMealNutritionModel(
    title: "Fats",
    image: AppImages.egg,
    value: "140g",
    percentage: 0.3,
    color: AppColors.amber,
  ),
  TodayMealNutritionModel(
    title: "Carbo",
    image: AppImages.corps,
    value: "140g",
    percentage: 0.3,
    color: AppColors.purple,
  ),
];
