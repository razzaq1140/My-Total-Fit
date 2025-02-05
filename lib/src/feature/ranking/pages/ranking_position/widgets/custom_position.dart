import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomPosition extends StatelessWidget {
  const CustomPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 160,
            width: 100,
            child: Column(
              children: [
                const SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.profile1))),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SvgPicture.asset(
                          AppIcons.flag1,
                          height: 20,
                          width: 26,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 34,
                  width: 73,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorScheme(context).primary),
                  child: Center(
                    child: Text(
                      "1469 Ex",
                      style: textTheme(context).bodySmall?.copyWith(
                          color: colorScheme(context).onPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 180,
            width: 80,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 21),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Stack(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(AppImages.profile2))),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(
                                AppIcons.flag2,
                                height: 20,
                                width: 26,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        height: 34,
                        width: 73,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorScheme(context).primary),
                        child: Center(
                          child: Text(
                            "1469 Ex",
                            style: textTheme(context).bodySmall?.copyWith(
                                color: colorScheme(context).onPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage(AppImages.medel))),
                )
              ],
            ),
          ),
          SizedBox(
            height: 170,
            width: 100,
            child: Column(
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.profile2))),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SvgPicture.asset(
                          AppIcons.flag2,
                          height: 20,
                          width: 26,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 34,
                  width: 73,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorScheme(context).primary),
                  child: Center(
                    child: Text(
                      "1469 Ex",
                      style: textTheme(context).bodySmall?.copyWith(
                          color: colorScheme(context).onPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
