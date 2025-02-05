import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomWomenStreching extends StatefulWidget {
  final String image;
  final String title;
  final String level;
  final String time;
  const CustomWomenStreching(
      {super.key,
      required this.image,
      required this.title,
      required this.level,
      required this.time});

  @override
  State<CustomWomenStreching> createState() => _CustomWomenStrechingState();
}

class _CustomWomenStrechingState extends State<CustomWomenStreching> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: colorScheme(context).primary,
                    width: 2,
                  ),
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: colorScheme(context).primary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: isVisible == true
                              ? Icon(
                                  Icons.favorite,
                                  color: colorScheme(context).primary,
                                )
                              : const Icon(Icons.favorite_outline)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.title,
            style: textTheme(context)
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                widget.level,
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
                widget.time,
                style: textTheme(context).labelSmall,
              )
            ],
          ),
        ],
      ),
    );
  }
}
