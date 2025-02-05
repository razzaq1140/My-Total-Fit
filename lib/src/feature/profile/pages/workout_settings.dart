import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/profile/widgets/custom_row.dart';

class WorkoutSettings extends StatefulWidget {
  const WorkoutSettings({super.key});

  @override
  State<WorkoutSettings> createState() => _WorkoutSettingsState();
}

class _WorkoutSettingsState extends State<WorkoutSettings> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Workout Setting",
          style: textTheme(context).headlineSmall,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(16),
                // height: 275,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomRowFor(text: "Background", icon: AppIcons.background),
                    const SizedBox(height: 10),
                    CustomRowFor(text: "Equipment", icon: AppIcons.vector),
                    const SizedBox(height: 10),
                    CustomRowFor(text: "Person", icon: AppIcons.person),
                    const SizedBox(height: 10),
                    CustomRowFor(text: "Lightning", icon: AppIcons.light),
                    const SizedBox(height: 10),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset(AppIcons.theme),
                      title: Text(
                        "Mood/Theme",
                        style: textTheme(context).bodyMedium,
                      ),
                      trailing: Switch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = !switchValue;
                          });
                        },
                      ),
                    )
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
