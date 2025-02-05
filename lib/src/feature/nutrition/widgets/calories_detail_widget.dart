import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';
import 'package:my_total_fit/src/feature/nutrition/widgets/multi_segment_progress.dart';

class CaloriesDetailWidget extends StatefulWidget {
  const CaloriesDetailWidget({super.key});

  @override
  State<CaloriesDetailWidget> createState() => _CaloriesDetailWidgetState();
}

class _CaloriesDetailWidgetState extends State<CaloriesDetailWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF0F0FF),
        border: Border.all(color: colorScheme(context).primary, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(19),
        ),
      ),
      height: 230,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    "Macros",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Calories",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              dividerHeight: 0,
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              labelColor: Theme.of(context).colorScheme.primary,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Content for "Macros" tab
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const MultiSegmentProgressIndicator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Consumed",
                                style: textTheme(context).bodySmall,
                              ),
                              Row(
                                children: [
                                  Container(
                                    color: AppColors.blue,
                                    height: 12,
                                    width: 12,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text("1500"),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Burned",
                                style: textTheme(context).bodySmall,
                              ),
                              Row(
                                children: [
                                  Container(
                                    color: AppColors.amber,
                                    height: 12,
                                    width: 12,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text("300"),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Heart Points",
                                style: textTheme(context).bodySmall,
                              ),
                              Row(
                                children: [
                                  Container(
                                    color: AppColors.pink,
                                    height: 12,
                                    width: 12,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text("30"),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  // Content for "Calories" tab
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const MultiSegmentProgressIndicator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Consumed",
                                style: textTheme(context).bodySmall,
                              ),
                              Row(
                                children: [
                                  Container(
                                    color: AppColors.blue,
                                    height: 12,
                                    width: 12,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text("1500"),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Burned",
                                style: textTheme(context).bodySmall,
                              ),
                              Row(
                                children: [
                                  Container(
                                    color: AppColors.amber,
                                    height: 12,
                                    width: 12,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text("300"),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Heart Points",
                                style: textTheme(context).bodySmall,
                              ),
                              Row(
                                children: [
                                  Container(
                                    color: AppColors.pink,
                                    height: 12,
                                    width: 12,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text("30"),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
