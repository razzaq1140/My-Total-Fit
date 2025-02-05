import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class ExerciseDaysPage extends StatefulWidget {
  const ExerciseDaysPage({super.key});

  @override
  State<ExerciseDaysPage> createState() => _ExerciseDaysPageState();
}

class _ExerciseDaysPageState extends State<ExerciseDaysPage> {
  // final daysList = ["1-2 days", "3-4 days", "5-6 days", "7 days"];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentPage = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildTab(int index, String label) {
    bool isActive = _currentPage == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: SizedBox(
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isActive
                ? Container(
                    width: 53,
                    height: 53,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme(context).primary,
                        width: 7,
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: 8,
                    backgroundColor:
                        colorScheme(context).primary.withOpacity(0.3),
                  ),
            Text(label,
                style: TextStyle(color: isActive ? Colors.red : Colors.grey)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                MyAppRouter.clearAndNavigate(context, AppRoute.signInPage);
              },
              child: Text(
                'Skip',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          )
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(12),
          child: CustomProgressBar(currentStep: 4, totalSteps: 11),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                WorkourDaysPage(
                  image: AppImages.days1,
                  title: '1 times /week',
                  description: 'I enjoy workout as a part of my lifestyle',
                ),
                WorkourDaysPage(
                  image: AppImages.days2,
                  title: '2 times /week',
                  description: 'I enjoy workout as a part of my lifestyle',
                ),
                WorkourDaysPage(
                  image: AppImages.days3,
                  title: '3 times /week',
                  description: 'I enjoy workout as a part of my lifestyle',
                ),
                WorkourDaysPage(
                  image: AppImages.days4,
                  title: '4 times /week',
                  description: 'I enjoy workout as a part of my lifestyle',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTab(0, "Less"),
              _buildTab(1, ""),
              _buildTab(2, ""),
              _buildTab(3, "More"),
            ],
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.preferenceExercise);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class WorkourDaysPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const WorkourDaysPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: textTheme(context)
                  .headlineSmall
                  ?.copyWith(color: Colors.black),
              children: [
                const TextSpan(text: "How often would you like to "),
                TextSpan(
                  text: "work out",
                  style: TextStyle(color: colorScheme(context).primary),
                ),
                const TextSpan(text: "?"),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Image.asset(
            image,
            height: 150,
          ),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: textTheme(context).labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
