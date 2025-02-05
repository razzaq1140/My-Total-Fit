import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomContainerWidget extends StatelessWidget {
  final String wight;
  final String name;
  final double percent;
  final String image;
  const CustomContainerWidget({super.key,
    required this.wight,
    required this.name,
    required this.percent,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 139,
      width: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(wight,style: textTheme(context).titleMedium?.copyWith(letterSpacing: 0),),
          Text(name,style: textTheme(context).labelSmall?.copyWith(fontSize: 8,letterSpacing: 0),),
          SizedBox(height: 12,),
          Center(
            child: CircularPercentIndicator(
              radius: 26,
              lineWidth: 3,
              percent: percent,
              backgroundColor: colorScheme(context).outlineVariant,
              center: SvgPicture.asset(image,height: 20,),
            ),
          )
        ],
      ),
    );
  }
}
