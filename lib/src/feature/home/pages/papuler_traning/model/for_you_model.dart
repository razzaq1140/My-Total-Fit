import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForYouModel {
  String? image;
  String? title;
  String? time;
  Widget? svg;
  String? level;
  ForYouModel(
      {required this.image,
      required this.svg,
      required this.time,
      required this.level,
      required this.title});
}

List<ForYouModel> foryouList = [
  ForYouModel(
      level: "Beginner",
      image: AppImages.girl1,
      svg: SvgPicture.asset(AppIcons.clock),
      time: "50 min",
      title: "Be Free"),
  ForYouModel(
      level: "Intermediate",
      image: AppImages.girl2,
      svg: SvgPicture.asset(AppIcons.clock),
      time: "20 min",
      title: "Energym"),
  ForYouModel(
      level: "Advanced",
      image: AppImages.girl3,
      svg: SvgPicture.asset(AppIcons.clock),
      time: "50 min",
      title: "Be Free"),
];
