import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';

class CustomCatogery extends StatelessWidget {
  final String image;
  final String title;
  const CustomCatogery({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.contain)),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: textTheme(context).bodyMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}
