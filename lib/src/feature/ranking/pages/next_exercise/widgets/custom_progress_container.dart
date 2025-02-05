import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomProgressContainer extends StatelessWidget {
  const CustomProgressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      width: 327,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: colorScheme(context).primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colorScheme(context).primary)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Monthly",
                style: textTheme(context)
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: colorScheme(context).primary,
              )
            ],
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
                text: "You have Completed",
                style: textTheme(context)
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: " 78 \n Exercises",
                      style: textTheme(context).headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme(context).primary)),
                  TextSpan(
                      text: " this month!",
                      style: textTheme(context)
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ]),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 148,
            width: 148,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 148,
                  height: 148,
                  child: CircularProgressIndicator(
                    value: 0.8, // 80% as an example
                    strokeWidth: 6,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme(context).primary,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("78",
                        style: textTheme(context)
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    Text(
                      "Exercises",
                      style: textTheme(context).bodyLarge?.copyWith(
                          color: AppColors.appGrey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 96,
                width: 140,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorScheme(context).onPrimary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("5",
                            style: textTheme(context)
                                .headlineLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const Icon(
                          Icons.edit_outlined,
                          size: 24,
                        )
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Remaining",
                      style: textTheme(context).bodyLarge,
                    )
                  ],
                ),
              ),
              Container(
                height: 96,
                width: 140,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorScheme(context).primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("78",
                            style: textTheme(context).headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme(context).onPrimary)),
                        SvgPicture.asset(
                          AppIcons.medal,
                          height: 24,
                          width: 24,
                        )
                      ],
                    ),
                    Text(
                      "Completed Exercises",
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(color: colorScheme(context).onPrimary),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
