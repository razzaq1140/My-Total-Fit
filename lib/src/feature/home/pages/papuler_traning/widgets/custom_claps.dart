import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomClaps extends StatelessWidget {
  const CustomClaps({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(AppImages.claps), width: 400),
          const SizedBox(height: 10),
          Text(
            "Athlete Practicing Claps hands Arm Balance",
            style: textTheme(context)
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Beginner",
                style: textTheme(context).labelSmall,
              ),
              const SizedBox(width: 5),
              Text(
                "|",
                style: textTheme(context).labelSmall?.copyWith(
                    color: AppColors.appGrey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              SvgPicture.asset(AppIcons.clock),
              const SizedBox(width: 5),
              Text(
                "50 min",
                style: textTheme(context).labelSmall,
              )
            ],
          ),
        ],
      ),
    );
  }
}
