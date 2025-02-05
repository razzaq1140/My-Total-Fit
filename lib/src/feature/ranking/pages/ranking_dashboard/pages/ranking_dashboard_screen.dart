import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_dashboard/widgets/custom_levels.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_dashboard/widgets/ranking_custom_button.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class RankingDashboardScreen extends StatefulWidget {
  const RankingDashboardScreen({super.key});

  @override
  State<RankingDashboardScreen> createState() => _RankingDashboardScreenState();
}

class _RankingDashboardScreenState extends State<RankingDashboardScreen> {
  String selectedTab = 'weekly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Dashboard"),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RankingCustomButton(
                  color: selectedTab == 'weekly'
                      ? colorScheme(context).primary
                      : colorScheme(context).onPrimary,
                  text: 'Weekly',
                  onTap: () {
                    setState(() {
                      selectedTab = 'weekly';
                    });
                  },
                  textColor: selectedTab == 'weekly'
                      ? colorScheme(context).onPrimary
                      : colorScheme(context).primary,
                ),
                RankingCustomButton(
                  color: selectedTab == 'all_time'
                      ? colorScheme(context).primary
                      : colorScheme(context).onPrimary,
                  text: 'All Time',
                  onTap: () {
                    setState(() {
                      selectedTab = 'all_time';
                    });
                  },
                  textColor: selectedTab == 'all_time'
                      ? colorScheme(context).onPrimary
                      : colorScheme(context).primary,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  CustomLevels(image: AppImages.bluebg, svg: AppIcons.gift),
                  CustomLevels(image: AppImages.redbg, svg: AppIcons.lock),
                  const SizedBox.shrink(),
                  const SizedBox.shrink(),
                  CustomLevels(image: AppImages.redbg, svg: AppIcons.lock),
                  const SizedBox.shrink(),
                  const SizedBox.shrink(),
                  CustomLevels(image: AppImages.redbg, svg: AppIcons.lock),
                  CustomLevels(image: AppImages.bluebg, svg: AppIcons.gift),
                  const SizedBox.shrink(),
                  CustomLevels(image: AppImages.orangebg, svg: AppIcons.one),
                  const SizedBox.shrink(),
                ],
              ),
            ),
            // Start Button
            CustomButton(
                onTap: () {
                  context.pushNamed(AppRoute.nicework);
                },
                text: "Start"),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
