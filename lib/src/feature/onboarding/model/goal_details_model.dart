import 'package:my_total_fit/src/common/constents/app_images.dart';

class GoalDetailsModel {
  final String image;
  final String title;
  final String detail;

  GoalDetailsModel({
    required this.image,
    required this.title,
    required this.detail,
  });
}

List<GoalDetailsModel> goalDetailsList = [
  GoalDetailsModel(
    image: AppImages.loseWeightDetail,
    title: 'Weight loss made easy',
    detail:
        'With our simple workouts ,you will buran fast fat and make your dream figure in reality!',
  ),
  GoalDetailsModel(
    image: AppImages.buildMuscleDetail,
    title: 'Muscle gain at smart rhythm',
    detail:
        'Efficient muscle gain require parring exercise with recovery.we’ll help you find the ideal balance!',
  ),
  GoalDetailsModel(
    image: AppImages.keepFitDetail,
    title: 'Fitness without fatigue',
    detail:
        'Health lies in persistence ,not exhaustion.with minutes a day,you’ll find a batter self',
  ),
  GoalDetailsModel(
    image: AppImages.attractiveDetail,
    title: 'Elevate Your Look',
    detail:
        'Where elegance meets effortless allure. Transform your style, redefine your charm.',
  ),
];

List<GoalDetailsModel> goalDetailsListMale = [
  GoalDetailsModel(
    image: AppImages.loseWeightDetail,
    title: 'Weight loss made easy',
    detail:
        'With our simple workouts ,you will buran fast fat and make your dream figure in reality!',
  ),
  GoalDetailsModel(
    image: AppImages.buildMuscleDetail,
    title: 'Muscle gain at smart rhythm',
    detail:
        'Efficient muscle gain require parring exercise with recovery.we’ll help you find the ideal balance!',
  ),
  GoalDetailsModel(
    image: AppImages.keepFitDetail,
    title: 'Fitness without fatigue',
    detail:
        'Health lies in persistence ,not exhaustion.with minutes a day,you’ll find a batter self',
  ),
  GoalDetailsModel(
    image: AppImages.attractiveDetailMale,
    title: 'Elevate Your Look',
    detail:
        'Where elegance meets effortless allure. Transform your style, redefine your charm.',
  ),
];
