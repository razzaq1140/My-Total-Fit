import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomTabbar extends StatelessWidget {
  final TabController tabController;
  const CustomTabbar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      labelColor: colorScheme(context).primary,
      unselectedLabelColor: AppColors.appGrey,
      tabs: const [
        Tab(
          text: "Badge",
          iconMargin: EdgeInsets.all(10),
        ),
        Tab(text: "Stats"),
        Tab(text: "Details"),
      ],
      dividerColor: colorScheme(context).onPrimary,
      labelStyle: textTheme(context).labelMedium,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }
}
