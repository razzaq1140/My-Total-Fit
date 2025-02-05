// import 'package:flutter/material.dart';
// import 'package:my_ui/src/common/const/global_variable.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class CustomCircularProgressIndicator extends StatelessWidget {
//   final double progress;
//   final String label;
//   const CustomCircularProgressIndicator(
//       {super.key, required this.progress, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         decoration: BoxDecoration(
//           color: colorScheme(context).onPrimary,
//           borderRadius: const BorderRadius.all(Radius.circular(16)),
//           boxShadow: [
//             BoxShadow(
//               offset: const Offset(0, 4),
//               blurRadius: 4,
//               spreadRadius: 0,
//               color: colorScheme(context).outline,
//             ),
//           ],
//         ),
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ,
//             const SizedBox(height: 10),
//             Text(
//               label,
//               textAlign: TextAlign.center,
//               style: txtTheme(context).titleSmall!.copyWith(
//                     color: colorScheme(context).primary,
//                     letterSpacing: 0,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
