import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomRowWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap; // Define a callback for onTap

  const CustomRowWidget({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: onTap, // Assign the onTap callback to InkWell
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: textTheme(context).headlineLarge?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            Icon(
              Icons.chevron_right,
              color: colorScheme(context).onSurface,
            ),
          ],
        ),
      ),
    );
  }
}
