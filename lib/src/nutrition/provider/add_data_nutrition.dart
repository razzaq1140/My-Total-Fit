import 'package:flutter/foundation.dart';

class AddDataNutritionProvider extends ChangeNotifier {
  final List<Map<String, String>> _foodDataList = [];

  List<Map<String, String>> get foodDataList => _foodDataList;

  void addFoodData(String name, String calories, String time) {
    _foodDataList.add({
      'name': name,
      'calories': calories,
      'time': time,
    });
    notifyListeners();
  }
}
