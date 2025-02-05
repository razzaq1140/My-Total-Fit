import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 96,
                      width: 96,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: colorScheme(context).primary),
                          image: DecorationImage(
                              image: AssetImage(AppImages.profilepicture))),
                    ),
                    const SizedBox(height: 10),
                    Text("King Studio Games",
                        style: textTheme(context)
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _statCard("3", "Searchs"),
                    _statCard("0", "Calorie"),
                    _statCard("3", "Duration(min)"),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.gary.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      _optionCard(
                        AppIcons.gare,
                        () {
                          context.pushNamed(AppRoute.settingscree);
                        },
                        "Setting",
                      ),
                      _optionCard(AppIcons.bookmark, () {
                        context.pushNamed(AppRoute.fitnessProgressPage);
                      }, "My Workouts",
                          subtitle: "Lorem ipsum dolor sit amet, consectetur."),
                      _optionCard(AppIcons.backup, () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Backup in progress...',
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).onPrimary),
                            ),
                            duration: const Duration(seconds: 2),
                            backgroundColor: colorScheme(context).primary,
                          ),
                        );
                      }, "Backup & Restore"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Awards", style: textTheme(context).titleMedium),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(color: colorScheme(context).primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(top: 25),
                  height: 162,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.gary.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _awardCard(AppImages.medal1, "First Weekend"),
                      _awardCard(AppImages.medal4, "Final Active Day"),
                      _awardCard(AppImages.medal3, "Final Day with up"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _statCard(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: textTheme(context)
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        Text(label,
            style:
                textTheme(context).bodySmall?.copyWith(color: AppColors.gary)),
      ],
    );
  }

  Widget _optionCard(String icon, VoidCallback ontap, String title,
      {String? subtitle}) {
    return ListTile(
      leading: SvgPicture.asset(icon, height: 24, width: 24),
      title: Text(
        title,
        style: textTheme(context).bodyMedium,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: textTheme(context)
                  .labelSmall
                  ?.copyWith(color: AppColors.gary),
            )
          : null,
      trailing: const Icon(Icons.chevron_right, color: AppColors.gary),
      onTap: ontap,
    );
  }

  Widget _awardCard(String imagePath, String title) {
    return Column(
      children: [
        Container(
          height: 74,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath))),
        ),
        Text(title,
            textAlign: TextAlign.center,
            style: textTheme(context)
                .labelMedium
                ?.copyWith(fontWeight: FontWeight.w400)),
      ],
    );
  }
}
