import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/model/challenge_model.dart';
import 'package:my_total_fit/src/feature/home/widgets/challenge_container.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class AllChallengesPage extends StatefulWidget {
  const AllChallengesPage({super.key});

  @override
  State<AllChallengesPage> createState() => _AllChallengesPageState();
}

class _AllChallengesPageState extends State<AllChallengesPage> {
  // List of categories
  final List<String> categories = [
    'All',
    'Lose Weight',
    'Upper Body',
    'Abs',
    'Full Body',
    '14 Days Challenge',
  ];

  // Selected chip index
  int selectedIndex = 0;

  List<ChallengeModel> _filteredChallengeList = [];
  @override
  void initState() {
    _filteredChallengeList = challengeList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("All Challenges"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: List<Widget>.generate(categories.length, (index) {
                return ChoiceChip(
                  selectedShadowColor: Colors.transparent,
                  label: Text(
                    categories[index],
                    style: textTheme(context)
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  side: BorderSide.none,
                  selected: selectedIndex == index,
                  showCheckmark: false,
                  selectedColor: Colors.amber,
                  backgroundColor: Colors.grey[200],
                  onSelected: (bool isSelected) {
                    setState(() {
                      selectedIndex = isSelected ? index : selectedIndex;
                      if (categories[index] != "All") {
                        _filteredChallengeList = challengeList
                            .where(
                              (challenge) =>
                                  challenge.category == categories[index],
                            )
                            .toList();
                      } else {
                        _filteredChallengeList = challengeList;
                      }
                    });
                  },
                );
              }),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredChallengeList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final challenge = _filteredChallengeList[index];

                if (_filteredChallengeList.isEmpty) {
                  return const Center(
                    child: Text("No Data Found"),
                  );
                }

                return ChallengeContainer(
                  color: challenge.color,
                  title: challenge.title,
                  detail: challenge.description,
                  onTap: () {
                    context.pushNamed(AppRoute.challengeWorkout);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
