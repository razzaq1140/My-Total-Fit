import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/model/challenge_model.dart';
import 'package:my_total_fit/src/feature/home/widgets/challenge_container.dart';
import 'package:my_total_fit/src/feature/home/widgets/custom_row.dart';
import 'package:my_total_fit/src/feature/home/widgets/monthly_date_list.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:flutter/material.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Home Workout",
              style: textTheme(context)
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w600)),
          actions: [
            InkWell(
              onTap: () => context.pushNamed(AppRoute.dayStreak),
              child: Container(
                height: 20,
                width: 20,
                margin: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Image(image: AssetImage(AppImages.homeFire)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 10,
                        width: 10,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: textTheme(context)
                              .labelSmall!
                              .copyWith(fontSize: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeWorkoutList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final workout = homeWorkoutList[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: colorScheme(context).primary.withOpacity(0.1),
                      ),
                      child: Column(
                        children: [
                          Expanded(child: Image.asset(workout.image)),
                          const SizedBox(height: 2),
                          Text(
                            workout.label,
                            style: textTheme(context)
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("Today", style: textTheme(context).titleSmall),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.history,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      const MonthlyDateList(),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _showBottomSheet();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 35,
                                color: colorScheme(context).primary,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "Lorem Ipsum is simply dummy text",
                                style: textTheme(context)
                                    .labelLarge!
                                    .copyWith(color: AppColors.gary),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Plan Something",
                                style: textTheme(context).labelLarge!.copyWith(
                                      color: colorScheme(context).primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                CustomRow(
                    text1: "Challenge",
                    onTap: () {
                      context.pushNamed(AppRoute.allChallenges);
                    }),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      challengeList.length > 1 ? 1 : challengeList.length,
                  itemBuilder: (context, index) {
                    final challenge = challengeList[index];

                    return ChallengeContainer(
                      color: challenge.color,
                      title: challenge.title,
                      detail: challenge.description,
                      onTap: () {
                        context.pushNamed(AppRoute.challengeWorkout);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        height: 300.0, // Adjust height as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'What would you like to do?',
                    style: textTheme(context)
                        .headlineSmall!
                        .copyWith(color: colorScheme(context).primary),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.cancel_outlined),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: planList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final plan = planList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      context.pushNamed(AppRoute.workoutCreator);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          plan.image,
                          height: 31,
                          width: 31,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          plan.label,
                          style: textTheme(context).titleSmall,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
