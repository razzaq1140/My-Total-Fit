import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/profile/widgets/feedback.dart';
import 'package:my_total_fit/src/feature/profile/widgets/ratingwidget.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: colorScheme(context).onSurface,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          title: Text("Setting", style: textTheme(context).headlineSmall),
          centerTitle: false,
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.gary.withOpacity(0.3))),
                child: Column(
                  children: [
                    _settingsItem(
                      context,
                      icon: AppIcons.person,
                      title: "My Profile",
                      onTap: () {
                        context.pushNamed(AppRoute.settingPage);
                      },
                    ),
                    _settingsItem(
                      context,
                      icon: AppIcons.hot,
                      title: "Workout Setting",
                      onTap: () {
                        context.pushNamed(AppRoute.workoutsetting);
                      },
                    ),
                    _settingsItem(
                      context,
                      icon: AppIcons.genral,
                      title: "General Setting",
                      onTap: () {
                        context.pushNamed(AppRoute.genralsetting);
                      },
                    ),
                    _settingsItemWithTrailing(
                      context,
                      icon: AppIcons.lang,
                      title: "Language",
                      trailing: Text("English (US)",
                          style: textTheme(context)
                              .bodySmall
                              ?.copyWith(color: colorScheme(context).primary)),
                      onTap: () {},
                    ),
                    _settingsItemWithSwitch(
                      context,
                      icon: AppIcons.ellipse,
                      title: "Apple Health",
                      switchValue: switchValue,
                      onSwitchChanged: (value) {
                        setState(() {
                          switchValue = !switchValue;
                        });
                      },
                    ),
                    _settingsItem(
                      context,
                      icon: AppIcons.upgrade,
                      title: "Upgrade Plan",
                      onTap: () {
                        context.pushNamed(AppRoute.subscriptions, extra: true);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text("Support us",
                  style: textTheme(context)
                      .labelLarge
                      ?.copyWith(color: AppColors.gary)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.gary.withOpacity(0.3))),
                child: Column(
                  children: [
                    _settingsItem(
                      context,
                      icon: AppIcons.str1,
                      title: "Rate us",
                      onTap: () {
                        _showStarDialog(context);
                      },
                    ),
                    _settingsItem(
                      context,
                      icon: AppIcons.feedback,
                      title: "Feedback",
                      onTap: () {
                        _showFeedbackDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _settingsItem(
    BuildContext context, {
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: SvgPicture.asset(icon),
      title: Text(
        title,
        style: textTheme(context).labelLarge,
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _settingsItemWithTrailing(
    BuildContext context, {
    required String icon,
    required String title,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: SvgPicture.asset(icon),
      title: Text(
        title,
        style: textTheme(context).labelLarge,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _settingsItemWithSwitch(
    BuildContext context, {
    required String icon,
    required String title,
    required bool switchValue,
    required ValueChanged<bool> onSwitchChanged,
  }) {
    return ListTile(
      leading: SvgPicture.asset(icon),
      title: Text(
        title,
        style: textTheme(context).labelLarge,
      ),
      trailing: Switch(
        value: switchValue,
        onChanged: onSwitchChanged,
      ),
    );
  }

  void _showStarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const StarRatingDialog(),
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const FeedbackDialog(),
    );
  }
}
