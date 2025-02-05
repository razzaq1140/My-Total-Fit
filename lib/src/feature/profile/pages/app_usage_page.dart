import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/profile/widgets/app_usage_%20custom_box.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AppUsagePage extends StatefulWidget {
  const AppUsagePage({super.key});

  @override
  State<AppUsagePage> createState() => _AppUsagePageState();
}

class _AppUsagePageState extends State<AppUsagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "App Usage",
            style: textTheme(context).headlineLarge?.copyWith(
                  color: colorScheme(context).onSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Responsive Linear Percent Indicator
                  Expanded(
                    child: LinearPercentIndicator(
                      lineHeight: 14.0,
                      percent: 0.8,
                      backgroundColor: AppColors.appGrey.withOpacity(0.3),
                      progressColor: AppColors.appOrange,
                      barRadius: const Radius.circular(15),
                    ),
                  ),
                  // Responsive Text
                  Text(
                    "87%",
                    style: textTheme(context).headlineLarge?.copyWith(
                          color: colorScheme(context).onSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              DualCircularIndicatorWidget(
                onTap: () {},
                outerPercentage: 0.7,
                innerPercentage: 0.6,
                outerLabel: "23 Days",
                innerLabel: "7 Days",
              )
            ])));
  }
}
