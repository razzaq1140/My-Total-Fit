import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class ClapPage extends StatefulWidget {
  const ClapPage({super.key});

  @override
  State<ClapPage> createState() => _ClapPageState();
}

class _ClapPageState extends State<ClapPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                MyAppRouter.clearAndNavigate(context, AppRoute.signInPage);
              },
              child: Text(
                'Skip',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          )
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(12),
          child: CustomProgressBar(currentStep: 9, totalSteps: 10),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(child: SizedBox()),
            Image.asset(
              AppImages.clap,
              width: screenWidth * 0.7,
            ),
            Text("Good to hear!", style: textTheme(context).titleMedium),
            Text(
              "Get moving and enjoy your fitness journey!",
              style: textTheme(context).bodyMedium,
            ),
            const Spacer(),
            CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.weightGraph);
              },
            ),
          ],
        ),
      ),
    );
  }
}
