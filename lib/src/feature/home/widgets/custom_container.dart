// import 'package:my_total_fit/src/common/constents/app_images.dart';
// import 'package:my_total_fit/src/common/global_veriable.dart';
// import 'package:my_total_fit/src/common/widgets/custom_button.dart';
// import 'package:flutter/material.dart';

// class ChallengesContainer extends StatelessWidget {
//   final String title;
//   final String description;
//   final Function() onTap;

//   const ChallengesContainer({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       width: 235,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: colorScheme(context).primary),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: textTheme(context).titleMedium),
//                   const SizedBox(height: 10),
//                   Text(description,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: textTheme(context).labelSmall),
//                   const SizedBox(height: 10),
//                   Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 10),
//                       height: 32,
//                       child: CustomButton(
//                         onTap: onTap,
//                         text: "Start",
//                         textSize: 14,
//                       ))
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: Image.asset(
//                 AppImages.physicalfitness,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
