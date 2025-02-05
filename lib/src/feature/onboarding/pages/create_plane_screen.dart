import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';

import 'package:my_total_fit/src/feature/onboarding/widgets/progress_indicator_onboarding.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class CreatePlanScreen extends StatefulWidget {
  const CreatePlanScreen({super.key});

  @override
  _CreatePlanScreenState createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  double progressPercent = 0.19;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      context.pushReplacementNamed(AppRoute.muscleg);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedGender =
        Provider.of<OnboardingProvider>(context).selectedGender;
    bool isMale = selectedGender == 'male';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Create your plan...",
              style: textTheme(context).headlineSmall,
            ),
            ProgressIndicatorOnboarding(
              progressPercent: progressPercent,
            ),
            Text(
              isMale
                  ? "10m+ Global men’s Fitness Choice"
                  : "10m+ Global Women’s\nFitness Choice",
              style: textTheme(context).headlineMedium?.copyWith(
                  color: colorScheme(context).primary,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            isMale
                ? SizedBox(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 40,
                          left: 10,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(AppImages.men1),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: MediaQuery.of(context).size.width * 0.34,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppImages.men2),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: MediaQuery.of(context).size.width * 0.7,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppImages.men3),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: MediaQuery.of(context).size.width * 0.5,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppImages.men4),
                          ),
                        ),
                        Positioned(
                          top: 190,
                          left: MediaQuery.of(context).size.width * 0.07,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(AppImages.men5),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          left: MediaQuery.of(context).size.width * 0.4,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppImages.men6),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          left: MediaQuery.of(context).size.width * 0.7,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(AppImages.men7),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 40,
                          left: 10,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(AppImages.female1),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: MediaQuery.of(context).size.width * 0.34,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppImages.female2),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: MediaQuery.of(context).size.width * 0.7,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppImages.female3),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: MediaQuery.of(context).size.width * 0.5,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppImages.female4),
                          ),
                        ),
                        Positioned(
                          top: 190,
                          left: MediaQuery.of(context).size.width * 0.07,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(AppImages.female5),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          left: MediaQuery.of(context).size.width * 0.4,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppImages.female6),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          left: MediaQuery.of(context).size.width * 0.7,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(AppImages.female7),
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
