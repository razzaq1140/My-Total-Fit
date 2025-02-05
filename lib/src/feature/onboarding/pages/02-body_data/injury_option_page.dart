import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class InjuryOptionPage extends StatefulWidget {
  const InjuryOptionPage({super.key});

  @override
  State<InjuryOptionPage> createState() => _InjuryOptionPageState();
}

class _InjuryOptionPageState extends State<InjuryOptionPage> {
  List<int> selectedIndexes = [];
  bool isNone = true;
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
          child: CustomProgressBar(currentStep: 8, totalSteps: 10),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Have you suffered any injuries recently?",
              textAlign: TextAlign.center,
              style: textTheme(context)
                  .headlineSmall
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: isNone
                          ? colorScheme(context).primary
                          : Colors.grey.shade200),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: isNone
                      ? colorScheme(context).primary.withOpacity(0.1)
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                  ]),
              child: ListTile(
                minVerticalPadding: 30,
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundImage: AssetImage(AppImages.not),
                ),
                title: Text(
                  "None",
                  style: textTheme(context).bodyMedium!.copyWith(fontSize: 16),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                trailing: Checkbox(
                  visualDensity: VisualDensity.compact,
                  shape: const CircleBorder(),
                  side: BorderSide(
                      color: isNone
                          ? colorScheme(context).primary
                          : Colors.grey.shade300),
                  value: isNone ? true : false,
                  onChanged: (value) {
                    isNone = value!;
                    selectedIndexes = [];
                    setState(() {});
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: injuredOption.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final time = injuredOption[index];
                return InkWell(
                  onTap: () {
                    if (selectedIndexes.contains(index)) {
                      selectedIndexes.remove(index);
                    } else {
                      selectedIndexes.add(index);
                    }
                    if (selectedIndexes.isEmpty) {
                      isNone = true;
                    } else {
                      isNone = false;
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: selectedIndexes.contains(index)
                                ? colorScheme(context).primary
                                : Colors.grey.shade200),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: selectedIndexes.contains(index)
                            ? colorScheme(context).primary.withOpacity(0.1)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                        ]),
                    child: ListTile(
                      minVerticalPadding: 30,
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundImage: AssetImage(time.image),
                      ),
                      title: Text(
                        time.label,
                        style: textTheme(context)
                            .bodyMedium!
                            .copyWith(fontSize: 16),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      trailing: Checkbox(
                        visualDensity: VisualDensity.compact,
                        shape: const CircleBorder(),
                        side: BorderSide(
                            color: selectedIndexes.contains(index)
                                ? colorScheme(context).primary
                                : Colors.grey.shade300),
                        value: selectedIndexes.contains(index) ? true : false,
                        onChanged: (value) {
                          if (selectedIndexes.contains(index)) {
                            selectedIndexes.remove(index);
                          } else {
                            selectedIndexes.add(index);
                          }
                          if (selectedIndexes.isEmpty) {
                            isNone = true;
                          } else {
                            isNone = false;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.clap);
              },
            ),
          ],
        ),
      ),
    );
  }
}
