import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_position/model/users_model.dart';

class LeaderboardEntryWidget extends StatelessWidget {
  final LeaderboardEntry entry;

  const LeaderboardEntryWidget({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme(context).primary, width: 2),
      ),
      child: Row(
        children: [
          Text('${entry.rank}', style: textTheme(context).bodyMedium),
          const SizedBox(width: 20),
          SizedBox(
            height: 50,
            width: 50,
            child: Stack(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage(entry.avatarUrl))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(
                    entry.countryFlag,
                    height: 15,
                    width: 22,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 8),
                Text(entry.name,
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                const SizedBox(height: 4),
                Text('${entry.points} points',
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(color: AppColors.appGrey)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          if (entry.rank == 1 || entry.rank == 2 || entry.rank == 3)
            SvgPicture.asset(entry.medal),
        ],
      ),
    );
  }
}
