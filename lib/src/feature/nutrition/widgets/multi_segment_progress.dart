import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';

class MultiSegmentProgressIndicator extends StatelessWidget {
  final double total = 1800;
  final double current = 1500;
  final double bluePercentage = 0.75;
  final double yellowPercentage = 0.25;
  final double redPercentage = 0.3;

  const MultiSegmentProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Red segment
          SizedBox(
            height: screenWidth * 0.3,
            width: screenWidth * 0.3,
            child: CircularProgressIndicator(
              value: redPercentage,
              strokeCap: StrokeCap.round,
              strokeWidth: 10,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.pink),
              backgroundColor: Colors.grey.shade300,
            ),
          ),
          // Blue segment
          SizedBox(
            height: screenWidth * 0.23,
            width: screenWidth * 0.23,
            child: CircularProgressIndicator(
              value: bluePercentage + yellowPercentage,
              strokeCap: StrokeCap.round,
              strokeWidth: 10,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
              backgroundColor: Colors.transparent,
            ),
          ),
          // Yellow segment
          SizedBox(
            height: screenWidth * 0.23,
            width: screenWidth * 0.23,
            child: CircularProgressIndicator(
              value: yellowPercentage,
              strokeWidth: 10,
              strokeCap: StrokeCap.round,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.amber),
              backgroundColor: Colors.transparent,
            ),
          ),
          // Text in the center
          Text(
            '${total.toInt()}',
            style: TextStyle(
                fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
