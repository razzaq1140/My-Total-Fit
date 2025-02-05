import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;

  //! Gender
  String _selectedGender = 'Male';
  String get selectedGender => _selectedGender;
  void updateGender({required String gender}) {
    _selectedGender = gender;
    notifyListeners();
  }

  //! Fitness Goal
  String _fitnessGoal = '';
  String get fitnessGoal => _fitnessGoal;
  void updateGoal({required String goal}) {
    _fitnessGoal = goal;
    notifyListeners();
  }

  //! Fitness Goal Index
  int _fitnessGoalIndex = -1;
  int get fitnessGoalIndex => _fitnessGoalIndex;
  void updateGoalIndex({required int goalIndex}) {
    _fitnessGoalIndex = goalIndex;
    notifyListeners();
  }

  //! ----------------------- Body Data ------------------------------

  // current height
  String _currentHeight = '';
  String get currentHeight => _currentHeight;
  void updateCurrentHeight({required String height}) {
    _currentHeight = height;
  }

  // current height Text
  String _currentHeightText = '';
  String get currentHeightText => _currentHeightText;
  void updateCurrentHeightText({required String heightText}) {
    _currentHeightText = heightText;
  }

  // current height in meter
  double _currentHeightMeter = 0.0;
  double get currentHeightMeter => _currentHeightMeter;
  void updateCurrentHeightMeter({required double heightMeter}) {
    _currentHeightMeter = heightMeter;
  }

  // current weight
  String _currentWeight = '';
  String get currentWeight => _currentWeight;
  void updateCurrentWeight({required String weight}) {
    _currentWeight = weight;
  }

  // current weight text
  String _currentWeightText = '';
  String get currentWeightText => _currentWeightText;
  void updateCurrentWeightText({required String weightTxt}) {
    _currentWeightText = weightTxt;
  }

  // target weight
  String _targetWeight = '';
  String get targetWeight => _targetWeight;
  void updateTargetWeight({required String weight}) {
    _targetWeight = weight;
  }

  // target weight text
  String _targetWeightText = '';
  String get targetWeightText => _targetWeightText;
  void updateTargetWeightText({required String weightTxt}) {
    _targetWeightText = weightTxt;
  }

  // current body shape
  String _currentBodyShape = '';
  String get currentBodyShape => _currentBodyShape;
  void updateBodyShape({required String bodyShape}) {
    _currentBodyShape = bodyShape;
  }

  // desired body shape
  String _desiredBodyShape = '';
  String get desiredBodyShape => _desiredBodyShape;
  void updateDesiredBodyShape({required String bodyShape}) {
    _desiredBodyShape = bodyShape;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
