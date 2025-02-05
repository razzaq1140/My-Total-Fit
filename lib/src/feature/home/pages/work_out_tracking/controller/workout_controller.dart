import 'package:flutter/material.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';

class WorkoutController with ChangeNotifier {
  List<ImageLabelModel> _newWorkoutList = [];
  List<ImageLabelModel> get newWorkoutList => _newWorkoutList;

  void addWorkoutList({required List<ImageLabelModel> newList}) {
    _newWorkoutList = newList;
    notifyListeners();
  }

  void clearWorkoutList() {
    _newWorkoutList = [];
    notifyListeners();
  }
}
