import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                MyAppRouter.clearAndNavigate(context, AppRoute.bottomNav);
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
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Lets Get Started!",
                  style: textTheme(context).headlineLarge?.copyWith(
                      color: colorScheme(context).primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 15,
              ),
              Text(
                "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.",
                style: textTheme(context).headlineLarge?.copyWith(
                    color: colorScheme(context).outline,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                AppImages.getStart,
                height: 302,
                width: 301,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 45,
                child: CustomButton(
                  textSize: 18,
                  color: colorScheme(context).primary,
                  textColor: colorScheme(context).surface,
                  onTap: () {
                    MyAppRouter.clearAndNavigate(context, AppRoute.bottomNav);
                  },
                  text: 'Get Startted',
                ),
              ),
            ],
          )),
    );
  }
}
