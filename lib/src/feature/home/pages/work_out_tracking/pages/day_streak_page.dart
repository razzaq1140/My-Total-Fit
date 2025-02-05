import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';

class DayStreakPage extends StatefulWidget {
  const DayStreakPage({super.key});

  @override
  State<DayStreakPage> createState() => _DayStreakPageState();
}

class _DayStreakPageState extends State<DayStreakPage> {
  final daysList = ["Mon", "Tue", "Wed", "Thr", "Fri", "Sat", "Sun"];
  int selected = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Image(image: AssetImage(AppImages.homeFire)),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "01",
                            textAlign: TextAlign.center,
                            style: textTheme(context)
                                .labelSmall!
                                .copyWith(fontSize: 36),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Day Streak",
                textAlign: TextAlign.center,
                style: textTheme(context)
                    .labelSmall!
                    .copyWith(fontSize: 31, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    daysList.length,
                    (index) {
                      final day = daysList[index];

                      return Column(
                        children: [
                          Text(
                            day,
                            style: textTheme(context).titleMedium,
                          ),
                          const SizedBox(height: 8),
                          index < selected
                              ? Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorScheme(context).primary,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Practicing daily grows your streak, but skipping a day resets it!",
                textAlign: TextAlign.center,
                style: textTheme(context)
                    .titleMedium!
                    .copyWith(color: AppColors.appGrey),
              ),
              const SizedBox(height: 40),
              CustomButton(
                  onTap: () {
                    context.pop();
                  },
                  text: "Continue"),
            ],
          ),
        ),
      ),
    );
  }
}
