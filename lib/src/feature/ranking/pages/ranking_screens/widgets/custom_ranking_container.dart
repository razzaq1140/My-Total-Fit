import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomRankingContainer extends StatelessWidget {
  const CustomRankingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      width: 713,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorScheme(context).primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 69,
            width: 85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(AppIcons.star),
                Text(
                  "POINTS",
                  style: textTheme(context).labelMedium?.copyWith(
                      color: colorScheme(context).onPrimary.withOpacity(0.4)),
                ),
                Text("590",
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(color: colorScheme(context).onPrimary))
              ],
            ),
          ),
          SizedBox(
            height: 69,
            width: 85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(AppIcons.language),
                Text(
                  "WORLD RANK",
                  style: textTheme(context).labelMedium?.copyWith(
                      color: colorScheme(context).onPrimary.withOpacity(0.4)),
                ),
                Text("#1,438",
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(color: colorScheme(context).onPrimary))
              ],
            ),
          ),
          SizedBox(
            height: 69,
            width: 85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(AppIcons.time),
                Text(
                  "LOCAL RANK",
                  style: textTheme(context).labelMedium?.copyWith(
                      color: colorScheme(context).onPrimary.withOpacity(0.4)),
                ),
                Text("#56",
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(color: colorScheme(context).onPrimary))
              ],
            ),
          )
        ],
      ),
    );
  }
}
