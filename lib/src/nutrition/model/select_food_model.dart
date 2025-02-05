class SelectFoodModel{
  String name;
  String calories;
  String time;
  SelectFoodModel({
    required this.name,
    required this.calories,
    required this.time
});
}

List<SelectFoodModel> selectFoodModelData = [
  SelectFoodModel(name: 'White Rice', calories: '502', time: '18:07'),
  SelectFoodModel(name: 'Water', calories: '502', time: '18:07'),
  SelectFoodModel(name: 'Steak', calories: '502', time: '18:07'),
];