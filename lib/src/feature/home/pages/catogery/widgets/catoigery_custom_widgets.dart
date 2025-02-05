// import 'package:my_total_fit/src/common/global_veriable.dart';
// import 'package:my_total_fit/src/feature/home/pages/catogery/model/category_model.dart';
// import 'package:flutter/material.dart';

// class CatoigeryCustomWidgets extends StatelessWidget {
//   final int index;
//   const CatoigeryCustomWidgets({super.key, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 150,
//       width: 200,
//       child: Row(
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: 100,
//                 width: 120,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: colorScheme(context).primary),
//                     borderRadius: BorderRadius.circular(8),
//                     image: DecorationImage(
//                         image: AssetImage(categoryList[index].image!),
//                         fit: BoxFit.contain)),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 categoryList[index].text!,
//                 style: textTheme(context).bodyMedium,
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
