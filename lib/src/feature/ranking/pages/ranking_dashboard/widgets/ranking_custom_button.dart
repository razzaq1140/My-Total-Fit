import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class RankingCustomButton extends StatelessWidget {
  final Color? textColor;
  final Color? color;
  final String? text;
  final VoidCallback? onTap;
  const RankingCustomButton(
      {super.key,
      required this.color,
      required this.text,
      required this.textColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: colorScheme(context).primary),
            color: color),
        child: Center(
          child: Text(
            text!,
            style: textTheme(context).titleSmall?.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
