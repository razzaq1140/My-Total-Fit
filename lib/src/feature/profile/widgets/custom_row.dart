import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomRowFor extends StatelessWidget {
  final String icon;
  final String text;
  const CustomRowFor({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListTile(
        leading: SvgPicture.asset(icon, height: 16, width: 18),
        contentPadding: EdgeInsets.zero,
        title: Text(
          text,
          style: textTheme(context).bodyMedium,
        ),
      ),
    );
  }
}
