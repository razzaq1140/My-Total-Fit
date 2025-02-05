import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatOptionIcon extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const ChatOptionIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme(context).primary.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        padding: const EdgeInsets.all(5),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
