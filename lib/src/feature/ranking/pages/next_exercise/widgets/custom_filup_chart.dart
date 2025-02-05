import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomFilupChart extends StatelessWidget {
  const CustomFilupChart({super.key});

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
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top performance by \ncategory",
                style: textTheme(context)
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.appGrey.withOpacity(0.4)),
                  child: SvgPicture.asset(
                    AppIcons.building,
                    height: 24,
                    width: 24,
                  ))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorScheme(context).onSecondary),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Legs",
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorScheme(context).secondary),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Arms",
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.appGrey),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Full body",
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 240,
            width: 295,
            child: BarChart(BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 10,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      switch (value.toInt()) {
                        case 0:
                          return _buildBottomTitle('3/10\n', context);
                        case 1:
                          return _buildBottomTitle('8/10\n', context);
                        case 2:
                          return _buildBottomTitle('6/10\n', context);
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    reservedSize: 32,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return Text('${(value * 10).toInt()}%',
                          style: textTheme(context)
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold));
                    },
                  ),
                ),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(color: Colors.orange[200], strokeWidth: 1);
                },
              ),
              barGroups: [
                _buildBarData(0, 3, colorScheme(context).onSecondary),
                _buildBarData(1, 8, colorScheme(context).secondary),
                _buildBarData(
                    2, 6, colorScheme(context).secondary.withOpacity(0.4)),
              ],
            )),
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "Exercises Completed",
                  textAlign: TextAlign.center,
                  style: textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Exercises Completed",
                  textAlign: TextAlign.center,
                  style: textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Exercises Completed",
                  textAlign: TextAlign.center,
                  style: textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ]));
  }

  BarChartGroupData _buildBarData(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 30,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }

  Widget _buildBottomTitle(String text, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(
          text,
          style: textTheme(context)
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ));
  }
}
