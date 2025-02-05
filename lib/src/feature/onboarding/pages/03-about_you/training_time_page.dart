import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class TrainingTimePage extends StatefulWidget {
  const TrainingTimePage({super.key});

  @override
  State<TrainingTimePage> createState() => _TrainingTimePageState();
}

class _TrainingTimePageState extends State<TrainingTimePage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
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
          child: CustomProgressBar(currentStep: 6, totalSteps: 11),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: textTheme(context)
                    .headlineSmall
                    ?.copyWith(color: Colors.black),
                children: [
                  const TextSpan(text: "How "),
                  TextSpan(
                    text: "much time",
                    style: TextStyle(color: colorScheme(context).primary),
                  ),
                  const TextSpan(
                      text: " can you dedicate to each training session?"),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const SizedBox(height: 30),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trainingTimeList.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final time = trainingTimeList[index];
                return InkWell(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                    Future.delayed(
                      const Duration(milliseconds: 250),
                      () => context.pushNamed(AppRoute.trainingType),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: selectedIndex == index
                                ? colorScheme(context).primary
                                : Colors.grey.shade200),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: selectedIndex == index
                            ? colorScheme(context).primary.withOpacity(0.1)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                        ]),
                    child: ListTile(
                      minVerticalPadding: 30,
                      leading: CircleAvatar(
                        foregroundImage: AssetImage(time.image),
                      ),
                      title: Text(
                        time.label,
                        style: textTheme(context)
                            .bodyMedium!
                            .copyWith(fontSize: 16),
                      ),
                      trailing: selectedIndex == index
                          ? Container(
                              decoration: BoxDecoration(
                                  color: colorScheme(context).primary,
                                  shape: BoxShape.circle),
                              padding: const EdgeInsets.all(3),
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 12,
                              ),
                            )
                          : null,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
