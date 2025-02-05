import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:provider/provider.dart';

class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({super.key});

  @override
  State<GenderSelectionPage> createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  bool isMaleSelected = true;

  Offset _offset = const Offset(0, 0.2);

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _offset = Offset.zero;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    final width = MediaQuery.of(context).size.width;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Text("What is your gender?",
                  style: textTheme(context).headlineLarge?.copyWith(
                      color: colorScheme(context).primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 25),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  color: colorScheme(context).primary.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.logo,
                      width: 50,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "This will help us tailor your workout to match your metabolic",
                        style: textTheme(context).bodyMedium,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: customImageLableContainer(
                      animationMs: 300,
                      image: AppImages.genderMale,
                      label: "Male",
                      onTap: () {
                        isMaleSelected = true;
                        onboardingProvider.updateGender(gender: "male");
                        Future.delayed(
                          const Duration(milliseconds: 300),
                          () => context.pushNamed(AppRoute.goalsAnimation),
                        );
                      },
                      width: width,
                      isSelected: isMaleSelected,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: customImageLableContainer(
                      animationMs: 500,
                      image: AppImages.genderFemale,
                      label: "Female",
                      onTap: () {
                        isMaleSelected = false;
                        onboardingProvider.updateGender(gender: "female");
                        Future.delayed(
                          const Duration(milliseconds: 300),
                          () => context.pushNamed(AppRoute.goalsAnimation),
                        );
                      },
                      width: width,
                      isSelected: !isMaleSelected,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  isMaleSelected = false;
                  onboardingProvider.updateGender(gender: "male");
                  Future.delayed(
                    const Duration(milliseconds: 300),
                    () => context.pushNamed(AppRoute.goalsAnimation),
                  );
                },
                child: Text(
                  "Other /i’d not say",
                  style: GoogleFonts.kantumruyPro(
                    color: Colors.black38,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell customImageLableContainer({
    required String image,
    required String label,
    required Function() onTap,
    required double width,
    required bool isSelected,
    required int animationMs,
  }) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap,
      child: AnimatedSlide(
        duration: Duration(milliseconds: animationMs),
        offset: _offset,
        child: SizedBox(
          height: width * 0.7,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: width * 0.6,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colorScheme(context).primary.withOpacity(0.1)
                        : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? colorScheme(context).primary
                          : Colors.grey.shade200,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isSelected
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: colorScheme(context).primary,
                                    shape: BoxShape.circle),
                                padding: const EdgeInsets.all(3),
                                child: const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            )
                          : const SizedBox(height: 18),
                      const SizedBox(height: 10),
                      Text(
                        label,
                        style: textTheme(context)
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: width * 0.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
