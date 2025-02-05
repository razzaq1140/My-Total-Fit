import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/bottom_navigation_bar/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, bottomNavProvider, child) => Scaffold(
        body: bottomNavProvider.screens[bottomNavProvider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle:
              textTheme(context).labelSmall!.copyWith(letterSpacing: 0),
          unselectedLabelStyle:
              textTheme(context).labelSmall!.copyWith(letterSpacing: 0),
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: colorScheme(context).surface,
          selectedItemColor: colorScheme(context).primary,
          unselectedItemColor: colorScheme(context).onSurface.withOpacity(0.5),
          currentIndex: bottomNavProvider.currentIndex,
          onTap: (index) =>
              bottomNavProvider.changeIndex(context: context, index: index),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                height: 70,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: bottomNavProvider.currentIndex == 0
                    ? BoxDecoration(
                        color: colorScheme(context).primary.withOpacity(0.1),
                        border: Border.all(
                            color: colorScheme(context).primary, width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)))
                    : const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppImages.home,
                      height: 42,
                      width: 42,
                    ),
                    Text(
                      "Home",
                      style: textTheme(context).bodySmall!.copyWith(
                            color: bottomNavProvider.currentIndex == 0
                                ? colorScheme(context).primary
                                : colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.5),
                          ),
                    )
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 70,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: bottomNavProvider.currentIndex == 1
                    ? BoxDecoration(
                        color: colorScheme(context).primary.withOpacity(0.1),
                        border: Border.all(
                            color: colorScheme(context).primary, width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)))
                    : const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppImages.ai,
                      height: 42,
                      width: 42,
                    ),
                    Text(
                      "Ai Chat",
                      style: textTheme(context).bodySmall!.copyWith(
                            color: bottomNavProvider.currentIndex == 1
                                ? colorScheme(context).primary
                                : colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.5),
                          ),
                    )
                  ],
                ),
              ),
              label: 'Ai Chat',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 70,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: bottomNavProvider.currentIndex == 2
                    ? BoxDecoration(
                        color: colorScheme(context).primary.withOpacity(0.1),
                        border: Border.all(
                            color: colorScheme(context).primary, width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)))
                    : const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppImages.nutrition,
                      height: 42,
                      width: 42,
                    ),
                    Text(
                      "Nutrition",
                      style: textTheme(context).bodySmall!.copyWith(
                            color: bottomNavProvider.currentIndex == 2
                                ? colorScheme(context).primary
                                : colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.5),
                          ),
                    )
                  ],
                ),
              ),
              label: 'Nutrition',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 70,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: bottomNavProvider.currentIndex == 3
                    ? BoxDecoration(
                        color: colorScheme(context).primary.withOpacity(0.1),
                        border: Border.all(
                            color: colorScheme(context).primary, width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)))
                    : const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppImages.ranking,
                      height: 42,
                      width: 42,
                    ),
                    Text(
                      "Ranking",
                      style: textTheme(context).bodySmall!.copyWith(
                            color: bottomNavProvider.currentIndex == 3
                                ? colorScheme(context).primary
                                : colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.5),
                          ),
                    )
                  ],
                ),
              ),
              label: 'Ranking',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 70,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: bottomNavProvider.currentIndex == 4
                    ? BoxDecoration(
                        color: colorScheme(context).primary.withOpacity(0.1),
                        border: Border.all(
                            color: colorScheme(context).primary, width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)))
                    : const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppImages.profile,
                      height: 42,
                      width: 42,
                    ),
                    Text(
                      "Profile",
                      style: textTheme(context).bodySmall!.copyWith(
                            color: bottomNavProvider.currentIndex == 4
                                ? colorScheme(context).primary
                                : colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.5),
                          ),
                    )
                  ],
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
