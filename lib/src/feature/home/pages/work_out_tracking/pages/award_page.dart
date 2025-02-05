import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class AwardPage extends StatefulWidget {
  const AwardPage({super.key});

  @override
  State<AwardPage> createState() => _AwardPageState();
}

class _AwardPageState extends State<AwardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme(context).primary,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                AppImages.award,
                height: 140,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImages.design,
                        height: 144,
                        width: 174,
                      ),
                    ),
                    const Center(
                      child: Text(
                        "02",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 60,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "BRAVO!",
                  style: textTheme(context)
                      .titleLarge!
                      .copyWith(color: Colors.white, fontSize: 26),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "YOUR ",
                      textAlign: TextAlign.center,
                      style: textTheme(context)
                          .titleLarge!
                          .copyWith(color: Colors.white, fontSize: 26),
                    ),
                    Text(
                      "3RD",
                      textAlign: TextAlign.center,
                      style: textTheme(context)
                          .titleLarge!
                          .copyWith(color: Colors.amber, fontSize: 26),
                    ),
                  ],
                ),
                Text(
                  "WORKOUT TODAY!",
                  textAlign: TextAlign.center,
                  style: textTheme(context)
                      .titleLarge!
                      .copyWith(color: Colors.white, fontSize: 26),
                ),
              ],
            ),
            CustomButton(
              onTap: () {
                MyAppRouter.clearAndNavigate(context, AppRoute.bottomNav);
              },
              text: "Done",
              color: Colors.white,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
