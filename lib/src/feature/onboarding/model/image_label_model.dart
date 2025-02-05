import 'package:my_total_fit/src/common/constents/app_images.dart';

class ImageLabelModel {
  final String image;
  final String label;
  final String? description;

  ImageLabelModel({required this.image, required this.label, this.description});
}

List<ImageLabelModel> goalsSelectionListMale = [
  ImageLabelModel(image: AppImages.loseWeightMale, label: "Lose weight"),
  ImageLabelModel(image: AppImages.buildMuscleMale, label: "Build Muscle"),
  ImageLabelModel(image: AppImages.keepFitMale, label: "Keep Fit"),
  // ImageLabelModel(image: AppImages.attractiveMale, label: "Look atractive"),
];

List<ImageLabelModel> goalsSelectionListFemale = [
  ImageLabelModel(image: AppImages.loseWeight, label: "Lose weight"),
  ImageLabelModel(image: AppImages.buildMuscle, label: "Build Muscle"),
  ImageLabelModel(image: AppImages.keepFit, label: "Keep Fit"),
  // ImageLabelModel(image: AppImages.attractive, label: "Look atractive"),
];

List<ImageLabelModel> preferenceList = [
  ImageLabelModel(image: AppImages.noEquipments, label: "No Equipment"),
  ImageLabelModel(image: AppImages.noPushup, label: "No Push-ups"),
  ImageLabelModel(image: AppImages.noRunning, label: "No Running"),
  ImageLabelModel(image: AppImages.dumbell, label: "Exercises Preference"),
];

List<ImageLabelModel> preferenceListMale = [
  ImageLabelModel(image: AppImages.noEquipments, label: "No Equipment"),
  ImageLabelModel(image: AppImages.noPushupMale, label: "No Push-ups"),
  ImageLabelModel(image: AppImages.noRunningMale, label: "No Running"),
  ImageLabelModel(image: AppImages.noPreference, label: "No Preference"),
];

List<ImageLabelModel> trainingTimeList = [
  ImageLabelModel(image: AppImages.clock, label: "Less than 30 minutes"),
  ImageLabelModel(image: AppImages.clockred, label: "30-45 minutes"),
  ImageLabelModel(image: AppImages.clockyellow, label: "45 minutes - 1 hour"),
  ImageLabelModel(image: AppImages.clocksimple, label: "More than 1 hour"),
];

List<ImageLabelModel> trainingTypeList = [
  ImageLabelModel(image: AppImages.house, label: "Home training"),
  ImageLabelModel(image: AppImages.gym, label: "Gym training"),
  ImageLabelModel(image: AppImages.tree, label: "Outdoor training"),
  ImageLabelModel(image: AppImages.setting, label: "No preference"),
];

List<ImageLabelModel> exerciseTypeList = [
  ImageLabelModel(image: AppImages.heart, label: "Cardio"),
  ImageLabelModel(
      image: AppImages.hit, label: "HIIT(High-Intensity Interval Training)"),
  ImageLabelModel(image: AppImages.yoga, label: "Yoga/Pilates"),
  ImageLabelModel(image: AppImages.stretch, label: "Stretching"),
  ImageLabelModel(image: AppImages.plank, label: "Calisthenics"),
];

List<ImageLabelModel> personalizedExercisesList = [
  ImageLabelModel(
      image: AppImages.personalizedExercise1, label: "Personalized exercises"),
  ImageLabelModel(
      image: AppImages.personalizedExercise2,
      label: "Nutrition & Macro Tracking"),
  ImageLabelModel(
      image: AppImages.personalizedExercise3,
      label: "AI-Powered Chat for Personalized Fitness & Nutrition Guidance"),
];

List<ImageLabelModel> featuresList = [
  ImageLabelModel(image: AppImages.dumbell, label: "Personalized Exercises"),
  ImageLabelModel(
      image: AppImages.plate, label: "Nutrition & Macro Tracking??"),
  ImageLabelModel(image: AppImages.ai, label: "AI Chat (Fitness/Nutrition)"),
];

List<ImageLabelModel> injuredOption = [
  ImageLabelModel(image: AppImages.sholder, label: "Shoulders"),
  ImageLabelModel(image: AppImages.knee, label: "Knee"),
  ImageLabelModel(image: AppImages.ankle, label: "Ankle"),
  ImageLabelModel(image: AppImages.lowerBack, label: "Lower back"),
];

List<ImageLabelModel> planDesignList = [
  ImageLabelModel(
      image: AppImages.focusArea,
      label: "Focus Area",
      description: "Full body"),
  ImageLabelModel(
      image: AppImages.exerciseDuration,
      label: "Exercise Duration",
      description: "7_12 min"),
  ImageLabelModel(
      image: AppImages.dailyBurned,
      label: "Daily Burned",
      description: "200 Kcal"),
  ImageLabelModel(image: AppImages.steps, label: "Steps", description: "8000"),
];

List<ImageLabelModel> bodyActivationExerciseList = [
  ImageLabelModel(
      image: AppImages.bodyActivation1, label: "30", description: "Seconds"),
  ImageLabelModel(
      image: AppImages.bodyActivation2, label: "20", description: "Seconds"),
  ImageLabelModel(
      image: AppImages.bodyActivation3, label: "30", description: "Seconds"),
  ImageLabelModel(
      image: AppImages.bodyActivation4, label: "60", description: "Seconds"),
];

List<ImageLabelModel> weightLossExerciseList = [
  ImageLabelModel(
      image: AppImages.weightLoss1, label: "30", description: "Seconds"),
  ImageLabelModel(
      image: AppImages.weightLoss2, label: "20", description: "Seconds"),
  ImageLabelModel(
      image: AppImages.weightLoss3, label: "30", description: "Seconds"),
  ImageLabelModel(
      image: AppImages.weightLoss4, label: "60", description: "Seconds"),
];

List<ImageLabelModel> bodyActivationExerciseListMale = [
  ImageLabelModel(image: AppImages.menex1, label: "30", description: "Seconds"),
  ImageLabelModel(image: AppImages.menex2, label: "20", description: "Seconds"),
  ImageLabelModel(image: AppImages.menex3, label: "30", description: "Seconds"),
  ImageLabelModel(image: AppImages.menex4, label: "60", description: "Seconds"),
];

List<ImageLabelModel> weightLossExerciseListMale = [
  ImageLabelModel(image: AppImages.menex1, label: "30", description: "Seconds"),
  ImageLabelModel(image: AppImages.menex2, label: "20", description: "Seconds"),
  ImageLabelModel(image: AppImages.menex3, label: "30", description: "Seconds"),
  ImageLabelModel(image: AppImages.menex4, label: "60", description: "Seconds"),
];

List<ImageLabelModel> elitePlanList = [
  ImageLabelModel(
      image: AppImages.subscriptionExercise,
      label: "Workout routines",
      description:
          "Tailored to your goals, helping you maximize progress safely and effectively."),
  ImageLabelModel(
      image: AppImages.subscriptionNutrition,
      label: "Personalized diet",
      description:
          "A meal plan designed to meet your unique nutritional goals and support your fitness progress."),
  ImageLabelModel(
      image: AppImages.macronutrintTracking,
      label: "Macronutrients Tracking",
      description:
          "Track and analyze your proteins, carbohydrates and fats to optimize your nutrition."),
  ImageLabelModel(
      image: AppImages.subscriptionAi,
      label: "Our AI chat",
      description:
          "Get instant support with your AI assistant: Design personalized workouts, tailor your diet and receive expect answers to boost your progress."),
  ImageLabelModel(
      image: AppImages.noAds,
      label: "No Ads",
      description:
          "Enjoy a seamless, ad-free experience focused on your fitness journey."),
];

List<ImageLabelModel> homeWorkoutList = [
  ImageLabelModel(image: AppImages.homeSteps, label: "Steps"),
  ImageLabelModel(image: AppImages.homeCardio, label: "Cardio"),
  ImageLabelModel(image: AppImages.homeStrength, label: "Strength"),
];

List<ImageLabelModel> planList = [
  ImageLabelModel(image: AppImages.workout, label: "workout"),
  ImageLabelModel(image: AppImages.activity, label: "Activity"),
  ImageLabelModel(image: AppImages.trackCardio, label: "Track Cardio"),
  ImageLabelModel(image: AppImages.trackProgress, label: "Track Progress"),
  ImageLabelModel(image: AppImages.logFood, label: "Log Food"),
];

List<ImageLabelModel> focusAreaList = [
  ImageLabelModel(image: AppImages.fullBody, label: "Full body"),
  ImageLabelModel(image: AppImages.abs, label: "Abs"),
  ImageLabelModel(image: AppImages.arm, label: "Arm"),
  ImageLabelModel(image: AppImages.upperBody, label: "Upper body"),
  ImageLabelModel(image: AppImages.leg, label: "Leg"),
  ImageLabelModel(image: AppImages.butt, label: "Butt"),
];

List<ImageLabelModel> levelList = [
  ImageLabelModel(image: AppImages.beginner, label: "Beginner"),
  ImageLabelModel(image: AppImages.intermediate, label: "Intermediate"),
  ImageLabelModel(image: AppImages.advance, label: "Advanced"),
];

List<ImageLabelModel> workoutListMale = [
  ImageLabelModel(
      image: AppImages.bicycleCeunchesMale,
      label: "STANDING BICYCLE CEUNCHES",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.jumpingJacksMale,
      label: "JUMPNG JACK",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.kneeCricleMale,
      label: "KNEE CIRCLE",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.shoulderGatorsMale,
      label: "SHOULDER GATORS",
      description: "00: 30"),
];

List<ImageLabelModel> workoutListFemale = [
  ImageLabelModel(
      image: AppImages.bicycleCeunchesFemale,
      label: "STANDING BICYCLE CEUNCHES",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.jumpingJacksFemale,
      label: "JUMPNG JACK",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.kneeCricleFemale,
      label: "KNEE CIRCLE",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.shoulderGatorsFemale,
      label: "SHOULDER GATORS",
      description: "00: 30"),
];

List<ImageLabelModel> warmUpListMale = [
  ImageLabelModel(
      image: AppImages.bicycleCeunchesMale,
      label: "STANDING BICYCLE CEUNCHES",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.jumpingJacksMale,
      label: "JUMPNG JACK",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.kneeCricleMale,
      label: "KNEE CIRCLE",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.shoulderGatorsMale,
      label: "SHOULDER GATORS",
      description: "00: 30"),
];

List<ImageLabelModel> warmUpListFemale = [
  ImageLabelModel(
      image: AppImages.bicycleCeunchesFemale,
      label: "STANDING BICYCLE CEUNCHES",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.jumpingJacksFemale,
      label: "JUMPNG JACK",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.kneeCricleFemale,
      label: "KNEE CIRCLE",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.shoulderGatorsFemale,
      label: "SHOULDER GATORS",
      description: "00: 30"),
];

List<ImageLabelModel> coolDownListMale = [
  ImageLabelModel(
      image: AppImages.bicycleCeunchesMale,
      label: "STANDING BICYCLE CEUNCHES",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.jumpingJacksMale,
      label: "JUMPNG JACK",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.kneeCricleMale,
      label: "KNEE CIRCLE",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.shoulderGatorsMale,
      label: "SHOULDER GATORS",
      description: "00: 30"),
];

List<ImageLabelModel> coolDownListFemale = [
  ImageLabelModel(
      image: AppImages.bicycleCeunchesFemale,
      label: "STANDING BICYCLE CEUNCHES",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.jumpingJacksFemale,
      label: "JUMPNG JACK",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.kneeCricleFemale,
      label: "KNEE CIRCLE",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.shoulderGatorsFemale,
      label: "SHOULDER GATORS",
      description: "00: 30"),
];

List<ImageLabelModel> trainingListMale = [
  ImageLabelModel(
      image: AppImages.bicycleCeunchesMale,
      label: "STANDING BICYCLE CEUNCHES",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.jumpingJacksMale,
      label: "JUMPNG JACK",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.kneeCricleMale,
      label: "KNEE CIRCLE",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.shoulderGatorsMale,
      label: "SHOULDER GATORS",
      description: "00: 30"),
];

List<ImageLabelModel> trainingListFemale = [
  ImageLabelModel(
      image: AppImages.bicycleCeunchesFemale,
      label: "STANDING BICYCLE CEUNCHES",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.jumpingJacksFemale,
      label: "JUMPNG JACK",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.kneeCricleFemale,
      label: "KNEE CIRCLE",
      description: "00: 30"),
  ImageLabelModel(
      image: AppImages.shoulderGatorsFemale,
      label: "SHOULDER GATORS",
      description: "00: 30"),
];

List<ImageLabelModel> workoutCompleteFeedbackList = [
  ImageLabelModel(image: AppImages.advance, label: "Hard"),
  ImageLabelModel(image: AppImages.intermediate, label: "Just Right"),
  ImageLabelModel(image: AppImages.beginner, label: "Easy"),
];
