import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_position/controller/home_controller.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_position/model/users_model.dart';
import 'package:my_total_fit/src/feature/ranking/pages/ranking_position/widgets/custom_user.dart';
import 'package:provider/provider.dart';

class LocationBottomSheet extends StatefulWidget {
  const LocationBottomSheet({super.key});

  @override
  State<LocationBottomSheet> createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<LocationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Consumer<CustomerHomeController>(
          builder: (context, controller, widget) {
        return GestureDetector(
          onVerticalDragUpdate: controller.setBottomSheetHeight,
          child: Container(
            height: controller.bottomSheetHeight,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: colorScheme(context).surface,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: leaderboardData.length,
                    itemBuilder: (context, index) {
                      return LeaderboardEntryWidget(
                        entry: leaderboardData[index],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
