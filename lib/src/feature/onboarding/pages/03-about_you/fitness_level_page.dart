import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_progress_bar.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FitnessLevelScreen extends StatefulWidget {
  const FitnessLevelScreen({super.key});

  @override
  _FitnessLevelScreenState createState() => _FitnessLevelScreenState();
}

class _FitnessLevelScreenState extends State<FitnessLevelScreen> {
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
          child: CustomProgressBar(currentStep: 3, totalSteps: 11),
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
              children: const [
                FitnessLevelPage(
                  title: 'Beginner',
                  description: 'I have never trained or do so sporadically',
                  percentage: 0.3,
                ),
                FitnessLevelPage(
                  title: 'Intermediate',
                  description: 'I have some experience and know some movements',
                  percentage: 0.65,
                ),
                FitnessLevelPage(
                  title: 'Advanced',
                  description: 'I train regularly and know advanced techniques',
                  percentage: 1,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTab(0, "Beginner"),
              _buildTab(1, "Intermediate"),
              _buildTab(2, "Advanced"),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomAnimatedButton(
              onTap: () {
                context.pushNamed(AppRoute.exerciseDays);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class FitnessLevelPage extends StatelessWidget {
  final String title;
  final String description;
  final double percentage;

  const FitnessLevelPage({
    super.key,
    required this.title,
    required this.description,
    required this.percentage,
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
                const TextSpan(text: "What's your "),
                TextSpan(
                  text: "Fitness Level",
                  style: TextStyle(color: colorScheme(context).primary),
                ),
                const TextSpan(text: " ?"),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CircularPercentIndicator(
            radius: 65,
            lineWidth: 13,
            percent: percentage,
            center: Image.asset(
              AppImages.fire,
              height: 34,
            ),
            linearGradient: LinearGradient(
              colors: [
                colorScheme(context).primary,
                colorScheme(context).onSecondary
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            backgroundColor: Colors.transparent,
            circularStrokeCap: CircularStrokeCap.butt,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
