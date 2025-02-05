import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';

class CustomWorkoutButton extends StatelessWidget {
  final Widget? text;
  final VoidCallback onTap;
  final Color? color;
  final Color? borderColor;

  const CustomWorkoutButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.color,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: borderColor ?? colorScheme(context).onSecondary,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [text!],
        ),
      ),
    );
  }
}
