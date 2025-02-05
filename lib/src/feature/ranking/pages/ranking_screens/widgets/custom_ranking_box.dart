import 'package:flutter/material.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_screens/model/images_model.dart';

class CustomRankingBox extends StatelessWidget {
  final int index;
  const CustomRankingBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 88,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagesList[index].image!), fit: BoxFit.cover)),
    );
  }
}
