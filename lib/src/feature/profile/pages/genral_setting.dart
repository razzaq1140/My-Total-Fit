import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/profile/widgets/custom_row.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "General Setting",
          style: textTheme(context).headlineSmall,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomRowFor(text: "Home", icon: AppIcons.home),
                    const SizedBox(height: 10),
                    CustomRowFor(text: "Profile", icon: AppIcons.person),
                    const SizedBox(height: 10),
                    CustomRowFor(
                        text: "Notification", icon: AppIcons.notification),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
