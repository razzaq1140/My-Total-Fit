import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';

class SubscriptionPlanModel {
  final String title;
  final double price;
  final String duration;
  final List<ImageLabelModel> features;
  final bool isRecommended;
  final String backgroundImg;
  final Color borderClr;

  SubscriptionPlanModel({
    required this.title,
    required this.price,
    required this.duration,
    required this.features,
    required this.isRecommended,
    required this.backgroundImg,
    required this.borderClr,
  });
}

final List<SubscriptionPlanModel> subscriptionPlansMonthly = [
  SubscriptionPlanModel(
    title: "STANDARD",
    price: 4.99,
    duration: "month",
    features: [
      ImageLabelModel(image: AppImages.noAds, label: "No Ads"),
      ImageLabelModel(
          image: AppImages.subscriptionExercise,
          label: "Personalized exercises")
    ],
    isRecommended: false,
    backgroundImg: AppImages.standardGradient,
    borderClr: const Color(0xff01D7B1),
  ),
  SubscriptionPlanModel(
    title: "PRO",
    price: 7.99,
    duration: "month",
    features: [
      ImageLabelModel(image: AppImages.noAds, label: "No Ads"),
      ImageLabelModel(
          image: AppImages.subscriptionExercise,
          label: "Personalized exercises"),
      ImageLabelModel(
          image: AppImages.macronutrintTracking,
          label: "Macronutrient Tracking"),
    ],
    isRecommended: false,
    backgroundImg: AppImages.proGradient,
    borderClr: Colors.indigo,
  ),
  SubscriptionPlanModel(
    title: "ELITE",
    price: 11.99,
    duration: "month",
    features: [
      ImageLabelModel(image: AppImages.noAds, label: "No Ads"),
      ImageLabelModel(
          image: AppImages.subscriptionExercise,
          label: "Personalized exercises"),
      ImageLabelModel(
          image: AppImages.macronutrintTracking,
          label: "Macronutrient Tracking"),
      ImageLabelModel(
          image: AppImages.subscriptionAi, label: "Access to AI Chat"),
    ],
    isRecommended: true,
    backgroundImg: AppImages.eliteGradient,
    borderClr: Colors.red,
  ),
];

final List<SubscriptionPlanModel> subscriptionPlansAnnualy = [
  SubscriptionPlanModel(
    title: "STANDARD",
    price: 3.99,
    duration: "month",
    features: [
      ImageLabelModel(image: AppImages.noAds, label: "No Ads"),
      ImageLabelModel(
          image: AppImages.subscriptionExercise,
          label: "Personalized exercises")
    ],
    isRecommended: false,
    backgroundImg: AppImages.standardGradient,
    borderClr: const Color(0xff01D7B1),
  ),
  SubscriptionPlanModel(
    title: "PRO",
    price: 5.99,
    duration: "month",
    features: [
      ImageLabelModel(image: AppImages.noAds, label: "No Ads"),
      ImageLabelModel(
          image: AppImages.subscriptionExercise,
          label: "Personalized exercises"),
      ImageLabelModel(
          image: AppImages.macronutrintTracking,
          label: "Macronutrient Tracking"),
    ],
    isRecommended: false,
    backgroundImg: AppImages.proGradient,
    borderClr: Colors.indigo,
  ),
  SubscriptionPlanModel(
    title: "ELITE",
    price: 8.99,
    duration: "month",
    features: [
      ImageLabelModel(image: AppImages.noAds, label: "No Ads"),
      ImageLabelModel(
          image: AppImages.subscriptionExercise,
          label: "Personalized exercises"),
      ImageLabelModel(
          image: AppImages.macronutrintTracking,
          label: "Macronutrient Tracking"),
      ImageLabelModel(
          image: AppImages.subscriptionAi, label: "Access to AI Chat"),
    ],
    isRecommended: true,
    backgroundImg: AppImages.eliteGradient,
    borderClr: Colors.red,
  ),
];
