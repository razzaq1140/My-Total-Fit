import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/ranking/pages/nice_work/widgets/custom_done_container.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class NiceWorkScreen extends StatefulWidget {
  const NiceWorkScreen({super.key});

  @override
  State<NiceWorkScreen> createState() => _NiceWorkScreenState();
}

class _NiceWorkScreenState extends State<NiceWorkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title Text
              Text("Nice Work",
                  style: textTheme(context)
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              const CustomDoneContainer(),
              const SizedBox(height: 20),
              // Star Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.icstar,
                    height: 32,
                    width: 32,
                  ),
                  SvgPicture.asset(
                    AppIcons.icstar,
                    height: 52,
                    width: 52,
                  ),
                  SvgPicture.asset(
                    AppIcons.icstar,
                    height: 32,
                    width: 32,
                  )
                ],
              ),
              const SizedBox(height: 10),

              Text("You Earned 80 pts", style: textTheme(context).titleMedium),
              const SizedBox(height: 40),
              CustomButton(
                  onTap: () {
                    context.pushNamed(AppRoute.nextexercise);
                  },
                  text: "Next Exercise")
            ],
          ),
        ),
      ),
    );
  }
}
