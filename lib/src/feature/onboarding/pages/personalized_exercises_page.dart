import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class PersonalizedExercisesPage extends StatefulWidget {
  const PersonalizedExercisesPage({super.key});

  @override
  State<PersonalizedExercisesPage> createState() =>
      _PersonalizedExercisesPageState();
}

class _PersonalizedExercisesPageState extends State<PersonalizedExercisesPage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
      ),
      floatingActionButton: FloatingActionButton(
        focusElevation: 0,
        enableFeedback: false,
        hoverElevation: 0,
        hoverColor: Colors.transparent,
        highlightElevation: 0,
        splashColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          if (currentIndex < personalizedExercisesList.length - 1) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.linear,
            );
          } else {
            context.pushNamed(AppRoute.getPlan);
          }
        },
        child: SvgPicture.asset(AppIcons.nextButton),
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: DecorationImage(
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              image: AssetImage(AppImages.onboardingbg),
            ),
          ),
          child: PageView.builder(
            controller: _pageController,
            itemCount: personalizedExercisesList.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final data = personalizedExercisesList[index];
              currentIndex = index;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      data.image,
                      width: screenWidth * 0.7,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data.label,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.instrumentSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
