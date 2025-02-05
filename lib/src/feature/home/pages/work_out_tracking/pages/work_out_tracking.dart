import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/model/tracking_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class WorkOutTrackingScreen extends StatefulWidget {
  const WorkOutTrackingScreen({super.key});

  @override
  State<WorkOutTrackingScreen> createState() => _WorkOutTrackingScreenState();
}

class _WorkOutTrackingScreenState extends State<WorkOutTrackingScreen>
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
        title: const Text("Workout Tracking"),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: colorScheme(context).primary,
            borderRadius: BorderRadius.circular(5),
          ),
          labelColor: colorScheme(context).onPrimary,
          unselectedLabelColor: colorScheme(context).onSurface,
          tabs: const [
            Tab(
              text: "Today",
              iconMargin: EdgeInsets.all(10),
            ),
            Tab(text: "Week"),
            Tab(text: "Month"),
          ],
          dividerColor: colorScheme(context).onPrimary,
          labelStyle: textTheme(context).labelMedium,
          indicatorPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildGridView(),
          _buildGridView(),
          _buildGridView(),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: workoutItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final item = workoutItems[index];
          return GestureDetector(
            onTap: () {
              context.pushNamed(AppRoute.allExercises);
            },
            child: Container(
              height: 180,
              width: 168,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorScheme(context).primary),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.title, style: textTheme(context).labelLarge),
                  const SizedBox(height: 8),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        width: 100,
                        height: 100,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 0.8),
                          duration: const Duration(
                              seconds: 2), // Duration of the animation
                          builder: (context, value, child) {
                            return CircularProgressIndicator(
                              strokeCap: StrokeCap.round,
                              value: value,
                              strokeWidth: 6,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  item.progressColor),
                            );
                          },
                        ),

                        // child: CircularProgressIndicator(
                        //   value: 0.8, // 80% as an example
                        //   strokeWidth: 6,
                        //   backgroundColor: Colors.grey[300],
                        //   valueColor: AlwaysStoppedAnimation<Color>(
                        //     item.progressColor,
                        //   ),
                        // ),
                      ),
                      Column(
                        children: [
                          Text(item.value,
                              style: textTheme(context).titleSmall),
                          Text(
                            item.unit,
                            style: textTheme(context).bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
