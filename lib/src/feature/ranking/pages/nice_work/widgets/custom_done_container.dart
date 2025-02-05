import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';

class CustomDoneContainer extends StatelessWidget {
  const CustomDoneContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.donebg))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 120,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppImages.donebg))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SvgPicture.asset(
              AppIcons.doneic,
              height: 21,
              width: 33,
            ),
          )
        ],
      ),
    );
  }
}
