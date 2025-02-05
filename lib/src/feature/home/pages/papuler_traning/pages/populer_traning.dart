import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/home/pages/exercise_details.dart/model/exercise_model.dart';
import 'package:my_total_fit/src/feature/home/pages/papuler_traning/model/for_you_model.dart';

import 'package:my_total_fit/src/feature/home/pages/papuler_traning/widgets/custom_for_you_widget.dart';
import 'package:my_total_fit/src/feature/home/pages/papuler_traning/widgets/women_streching.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class PopularTrining extends StatefulWidget {
  const PopularTrining({super.key});

  @override
  State<PopularTrining> createState() => _PopularTriningState();
}

class _PopularTriningState extends State<PopularTrining>
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
        title: const Text("Training"),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: colorScheme(context).primary,
                borderRadius: BorderRadius.circular(5),
              ),
              labelColor: colorScheme(context).onPrimary,
              unselectedLabelColor: colorScheme(context).primary,
              tabs: const [
                Tab(text: "Beginner"),
                Tab(text: "Intermediate"),
                Tab(text: "Advanced"),
              ],
              dividerColor: colorScheme(context).onPrimary,
              labelStyle: textTheme(context).labelMedium,
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTrainingContent(context, "Beginner"),
          _buildTrainingContent(context, "Intermediate"),
          _buildTrainingContent(context, "Advanced"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRoute.workout);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTrainingContent(BuildContext context, String level) {
    final filteredList =
        exerciseList.where((exercise) => exercise.level == level).toList();
    final filteredForYouList =
        foryouList.where((item) => item.level == level).toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular Training",
              style: textTheme(context)
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final exercise = exerciseList[index];

                return GestureDetector(
                  onTap: () => context.pushNamed(
                    AppRoute.excerciseDetails,
                    extra: filteredList[index],
                  ),
                  child: CustomWomenStreching(
                    image: exercise.image!,
                    title: exercise.title!,
                    level: exercise.level!,
                    time: exercise.time!,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              "Just for you",
              style: textTheme(context)
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredForYouList.length,
                itemBuilder: (context, index) {
                  return CustomForYouWidget(
                    index: index,
                    foryou: filteredForYouList,
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
