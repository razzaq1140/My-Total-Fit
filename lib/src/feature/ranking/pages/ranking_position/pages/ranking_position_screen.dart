import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_dashboard/widgets/ranking_custom_button.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_position/controller/home_controller.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_position/widgets/bottom_sheet.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_position/widgets/custom_position.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_position/widgets/custom_ranking_container.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class RankingPositionScreen extends StatefulWidget {
  const RankingPositionScreen({super.key});

  @override
  State<RankingPositionScreen> createState() => _RankingPositionScreenState();
}

class _RankingPositionScreenState extends State<RankingPositionScreen> {
  String selectedTab = 'weekly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                _showLocationBottomSheet(context);
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
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
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => context.pushNamed(AppRoute.positionlist),
                child: const CustomRankingContainerone(),
              ),
              const SizedBox(height: 15),
              const CustomPosition(),
              Container(
                height: 170,
                width: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.leaderboard),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _showLocationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (context) => CustomerHomeController(),
          child: const LocationBottomSheet(),
        );
      },
    );
  }
}
