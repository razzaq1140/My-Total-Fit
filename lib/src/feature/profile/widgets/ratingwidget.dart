import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StarRatingDialog extends StatefulWidget {
  const StarRatingDialog({super.key});

  @override
  StarRatingDialogState createState() => StarRatingDialogState();
}

class StarRatingDialogState extends State<StarRatingDialog> {
  int selectedStar = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text("Rate Us"),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return IconButton(
            onPressed: () {
              setState(() {
                selectedStar = index + 1;
              });

              Future.delayed(const Duration(milliseconds: 300), () {
                context.pop(selectedStar);
              });
            },
            icon: Icon(
              Icons.star,
              color: index < selectedStar ? Colors.orange : Colors.grey,
              size: 36,
            ),
          );
        }),
      ),
    );
  }
}
