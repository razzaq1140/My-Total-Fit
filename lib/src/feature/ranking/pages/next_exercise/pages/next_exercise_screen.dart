import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/ranking/pages/next_exercise/widgets/custom_filup_chart.dart';
import 'package:my_total_fit/src/feature/ranking/pages/next_exercise/widgets/custom_progress_container.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_screens/widgets/custom_ranking_container.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_screens/widgets/custom_tabbar.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class NextExerciseScreen extends StatefulWidget {
  const NextExerciseScreen({super.key});

  @override
  State<NextExerciseScreen> createState() => _NextExerciseScreenState();
}

class _NextExerciseScreenState extends State<NextExerciseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ranking"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Badge(
                        backgroundColor: colorScheme(context).primary,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image(image: AssetImage(AppImages.done)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.rankingimg),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () => context.pushNamed(AppRoute.rankingposition),
                  child: const CustomRankingContainer()),
              const SizedBox(height: 10),
              CustomTabbar(tabController: _tabController),
              const SizedBox(height: 10),
              const CustomProgressContainer(),
              const SizedBox(height: 10),
              const CustomFilupChart(),
            ],
          ),
        ),
      ),
    );
  }
}
