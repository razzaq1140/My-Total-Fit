import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

class ChallengeContainer extends StatelessWidget {
  final Color color;
  final String title;
  final String detail;
  final Function()? onTap;
  const ChallengeContainer({
    super.key,
    required this.color,
    required this.title,
    required this.detail,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    bool isMale = provider.selectedGender == "Male";
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 270,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: textTheme(context).headlineMedium!.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                  ),
                ),
                Image.asset(
                  isMale ? AppImages.homeMale : AppImages.buildMuscle,
                  width: screenWidth * 0.45,
                  height: 180,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    detail,
                    style: textTheme(context)
                        .bodyMedium!
                        .copyWith(color: Colors.white, fontSize: 13),
                  ),
                  const Spacer(),
                  CustomButton(
                    color: Colors.white,
                    onTap: onTap,
                    text: "Start",
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
