import 'package:my_total_fit/src/common/constents/app_images.dart';

class ExerciseModel {
  String? image;
  String? kcl;
  String? time;
  String? details;
  String? type;
  String? date;
  String? exerciseimage;
  String? title;
  String? subTitle1;
  String? subTitle2;
  String? level;
  String? populerTraningimage;
  String? populerTitle;
  String? populerleve;
  String? populerTime;

  ExerciseModel(
      {required this.image,
      required this.kcl,
      required this.time,
      required this.details,
      required this.date,
      required this.type,
      required this.exerciseimage,
      required this.title,
      required this.subTitle1,
      required this.subTitle2,
      required this.level,
      required this.populerTraningimage,
      required this.populerTitle,
      required this.populerleve,
      required this.populerTime});
}

List<ExerciseModel> exerciseList = [
  ExerciseModel(
      image: AppImages.details,
      kcl: "135 Kcal",
      time: "5 min",
      type: "Cardio",
      details:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,",
      date: "3 Weeks - 20 Exercise",
      exerciseimage: AppImages.exercise1,
      title: "Exercises with Jumping Rope",
      subTitle1: "110 kcal",
      subTitle2: "10 min",
      level: "Beginner",
      populerTraningimage: AppImages.women,
      populerTitle: "Full Shot Woman Stretching Arm",
      populerleve: "Beginner",
      populerTime: "30 min"),
  ExerciseModel(
      image: AppImages.exercise2,
      kcl: "135 Kcal",
      time: "5 min",
      type: "Legs",
      details:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,",
      date: "3 Weeks - 20 Exercise",
      exerciseimage: AppImages.claps,
      title: "Exercises with Jumping Rope",
      subTitle1: "110 kcal",
      subTitle2: "10 min",
      level: "Intermediate",
      populerTraningimage: AppImages.claps,
      populerTitle: "Athlete Practicing Claps hands Arm Balance",
      populerleve: "Intermediate",
      populerTime: "30 min"),
  ExerciseModel(
      image: AppImages.exercise3,
      kcl: "135 Kcal",
      time: "5 min",
      type: "Chest",
      details:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,",
      date: "3 Weeks - 20 Exercise",
      exerciseimage: AppImages.claps,
      title: "Exercises with Jumping Rope",
      subTitle1: "110 kcal",
      subTitle2: "10 min",
      level: "Advanced",
      populerTraningimage: AppImages.claps,
      populerTitle: "Full Shot Woman Stretching Arm",
      populerleve: "Advanced",
      populerTime: "30 min"),
  // ExerciseModel(
  //     image: AppImages.exercise,
  //     kcl: "135 Kcal",
  //     time: "5 min",
  //     type: "Back",
  //     details:
  //         "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,",
  //     date: "3 Weeks - 20 Exercise",
  //     exerciseimage: AppImages.claps,
  //     title: "Exercises with Jumping Rope",
  //     subTitle1: "110 kcal",
  //     subTitle2: "10 min",
  //     level: "Advanced",
  //     populerTraningimage: AppImages.claps,
  //     populerTitle: "Full Shot Woman Stretching Arm",
  //     populerleve: "Advanced",
  //     populerTime: "30 min"),
];
