import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class FitnessProgressPage extends StatefulWidget {
  const FitnessProgressPage({super.key});

  @override
  State<FitnessProgressPage> createState() => _FitnessProgressPageState();
}

class _FitnessProgressPageState extends State<FitnessProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("This Week",
            style: textTheme(context)
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _customStatBox(
                  title: "3",
                  sub1: "min",
                  subtitle: "Duration",
                  barValues: [0.6, 0.8, 0.5, 0.7, 0.9, 0.4, 0.8],
                  barColor: Colors.blue,
                ),
                const SizedBox(width: 16),
                _customStatBox(
                  title: "0",
                  sub1: "cbl",
                  subtitle: "Calories",
                  barValues: [0.3, 0.7, 0.6, 0.5, 0.8, 0.2, 0.4],
                  barColor: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Weight Section
            Text("Weight", style: textTheme(context).titleMedium),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _weightRow(context, "78.5", "Kg"),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 20),
                      child: Text(
                        "November",
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(color: AppColors.gary),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...["78.5", "77.5", "76.5", "75.5", "70.5"].map((weight) {
                      return Text(weight,
                          style: textTheme(context).bodyMedium?.copyWith(
                                color: AppColors.gary,
                              ));
                    }),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Goal:78.5 kg",
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(color: AppColors.gary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _footerStat(context, "0.0", "Last 7 Days"),
                _footerStat(context, "78.5", "Avg"),
                _footerStat(context, "24.8", "BMI"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Custom Box for Top Stats (Duration, Calories)
  Widget _customStatBox(
      {required String title,
      required String subtitle,
      required List<double> barValues,
      required Color barColor,
      required sub1}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle,
                  style: textTheme(context).bodyMedium,
                ),
                const Icon(Icons.chevron_right, color: AppColors.gary)
              ],
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                Row(
                  children: [
                    Text(title,
                        style: textTheme(context)
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 4),
                    Text(sub1, style: textTheme(context).bodySmall),
                  ],
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: barValues.map((value) {
                return Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 80,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: AppColors.gary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Container(
                        height: 50 * value,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: barColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footerStat(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(label,
            style:
                textTheme(context).bodySmall?.copyWith(color: AppColors.gary)),
        const SizedBox(height: 4),
        Text(value, style: textTheme(context).titleMedium),
      ],
    );
  }

  // Weight Row
  Widget _weightRow(BuildContext context, String weight, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current",
              style:
                  textTheme(context).bodySmall?.copyWith(color: AppColors.gary),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(weight, style: textTheme(context).headlineMedium),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(label, style: textTheme(context).labelSmall),
                ),
                const Icon(Icons.edit, size: 15)
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Goal",
              style:
                  textTheme(context).bodySmall?.copyWith(color: AppColors.gary),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("70.0", style: textTheme(context).headlineMedium),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(label, style: textTheme(context).labelSmall),
                ),
                const Icon(Icons.edit, size: 15)
              ],
            ),
          ],
        ),
      ],
    );
  }
}
