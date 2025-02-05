import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/home/pages/papuler_traning/model/for_you_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomForYouWidget extends StatelessWidget {
  final int index;
  final List<ForYouModel> foryou;
  const CustomForYouWidget(
      {super.key, required this.index, required this.foryou});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 200,
        width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(foryou[index].image!), fit: BoxFit.contain)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 80),
                Text(foryou[index].title!,
                    style: textTheme(context).bodyMedium),
                const SizedBox(height: 2),
                Row(
                  children: [
                    foryou[index].svg!,
                    const SizedBox(width: 5),
                    Text(
                      foryou[index].time!,
                      style: textTheme(context).labelSmall,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
