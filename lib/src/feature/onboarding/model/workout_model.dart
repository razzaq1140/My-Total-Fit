import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';

class WorkoutModel {
  final String category;
  final List<ImageLabelModel> workoutList;

  WorkoutModel({required this.category, required this.workoutList});
}

List<WorkoutModel> allWorkoutListMale = [
  WorkoutModel(category: "Warm-up", workoutList: workoutListMale),
  WorkoutModel(category: "Cool down", workoutList: workoutListMale),
  WorkoutModel(category: "Training", workoutList: workoutListMale),
];

List<WorkoutModel> allWorkoutListFemale = [
  WorkoutModel(category: "Warm-up", workoutList: workoutListMale),
  WorkoutModel(category: "Cool down", workoutList: workoutListMale),
  WorkoutModel(category: "Training", workoutList: workoutListMale),
];
