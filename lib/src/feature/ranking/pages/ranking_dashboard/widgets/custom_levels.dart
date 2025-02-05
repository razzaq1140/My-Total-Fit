import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomLevels extends StatelessWidget {
  final String? image;
  final String? svg;
  const CustomLevels({super.key, required this.image, required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(image!))),
      child: Center(
        child: SvgPicture.asset(
          svg!,
          height: 30,
          width: 25,
        ),
      ),
    );
  }
}
