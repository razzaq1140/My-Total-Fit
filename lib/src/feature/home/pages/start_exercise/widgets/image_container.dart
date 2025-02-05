import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';

class CustomImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(AppImages.details), fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              context.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
