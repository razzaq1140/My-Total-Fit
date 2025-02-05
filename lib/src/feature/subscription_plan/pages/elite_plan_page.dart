import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/feature/onboarding/model/image_label_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class ElitePlanPage extends StatefulWidget {
  const ElitePlanPage({super.key});

  @override
  State<ElitePlanPage> createState() => _ElitePlanPageState();
}

class _ElitePlanPageState extends State<ElitePlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme(context).primary,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          context.pushNamed(AppRoute.signInPage);
                        },
                        icon: const Icon(Icons.cancel_outlined,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.appYellow,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: Text(
                        "Elite",
                        style: textTheme(context)
                            .headlineMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Reach your goals 7x faster with",
                      style: GoogleFonts.kantumruyPro(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'MyTotalFit Elite',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Join the exclusive AI chat for Elite members and get personalized training and meal plans to crush your goals.",
                      style: GoogleFonts.kantumruyPro(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: elitePlanList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final plan = elitePlanList[index];
                  return ListTile(
                    leading: Image.asset(
                      plan.image,
                      height: 50,
                      width: 50,
                    ),
                    title: Text(
                      plan.label,
                      style: GoogleFonts.kantumruyPro(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      plan.description!,
                      style: textTheme(context)
                          .bodyMedium!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomAnimatedButton(
                  color: colorScheme(context).primary,
                  onTap: () {
                    context.pushNamed(AppRoute.signInPage);
                  },
                  text: "Try Elite for \$0.00",
                ),
              ),
              Text(
                "No Commitment, Cancel anytime",
                style: textTheme(context)
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
