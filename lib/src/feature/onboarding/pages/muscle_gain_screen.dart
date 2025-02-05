import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/feature/onboarding/widgets/progress_indicator_onboarding.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class MuscleGainScreen extends StatefulWidget {
  const MuscleGainScreen({super.key});

  @override
  _MuscleGainScreenState createState() => _MuscleGainScreenState();
}

class _MuscleGainScreenState extends State<MuscleGainScreen> {
  double progressPercent = 0.34;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      context.pushReplacementNamed(AppRoute.awardingplan1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedGender =
        Provider.of<OnboardingProvider>(context).selectedGender;

    bool isFemale = selectedGender == "female";
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
              "500+ Guided Easy Exercises",
              style: textTheme(context).headlineMedium?.copyWith(
                  color: colorScheme(context).primary,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            isFemale
                ? Container(
                    height: 200,
                    width: 389,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.group2),
                            fit: BoxFit.cover)),
                  )
                : SizedBox(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.custom(
                      gridDelegate: SliverWovenGridDelegate.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        pattern: [
                          const WovenGridTile(1),
                          const WovenGridTile(
                            5 / 7,
                            crossAxisRatio: 0.9,
                            alignment: AlignmentDirectional.centerEnd,
                          ),
                        ],
                      ),
                      childrenDelegate:
                          SliverChildBuilderDelegate((context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(AppImages.menex1),
                                fit: BoxFit.cover,
                              )),
                          alignment: Alignment.center,
                        );
                      }, childCount: 8),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
