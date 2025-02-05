import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/home/pages/all_exercies/model/all_exercises_model.dart';

class AllExercisesScreen extends StatefulWidget {
  const AllExercisesScreen({super.key});

  @override
  State<AllExercisesScreen> createState() => _AllExercisesScreenState();
}

class _AllExercisesScreenState extends State<AllExercisesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
        title: const Text("All Exercises"),
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
              text: "Cardio",
              iconMargin: EdgeInsets.all(10),
            ),
            Tab(text: "Legs"),
            Tab(text: "Back"),
            Tab(text: "Chest"),
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
          _buildGridView("Cardio"),
          _buildGridView("Legs"),
          _buildGridView("Back"),
          _buildGridView("Chest"),
        ],
      ),
    );
  }

  Widget _buildGridView(String type) {
    final filteredList =
        allExercisesList.where((exercise) => exercise.type == type).toList();
    return Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: filteredList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(filteredList[index].image!),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(width: 11),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          filteredList[index].title!,
                          style: textTheme(context)
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.calories,
                              height: 15,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              filteredList[index].subti!,
                              style: textTheme(context).labelSmall,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "|",
                              style: textTheme(context).bodyMedium,
                            ),
                            const SizedBox(width: 10),
                            SvgPicture.asset(
                              AppIcons.clock1,
                              height: 15,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              filteredList[index].time!,
                              style: textTheme(context).labelSmall,
                            ),
                          ],
                        ),
                        Text(
                          filteredList[index].value!,
                          style: textTheme(context).labelSmall,
                        )
                      ],
                    ),
                  ],
                ));
          },
        ));
  }
}
