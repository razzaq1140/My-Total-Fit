import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';

class Tile extends StatelessWidget {
  final int index;

  const Tile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(AppImages.menex1),
            fit: BoxFit.cover,
          )),
      alignment: Alignment.center,
    );
  }
}
