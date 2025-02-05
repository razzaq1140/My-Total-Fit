import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({super.key});

  @override
  FeedbackDialogState createState() => FeedbackDialogState();
}

class FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _feedbackController = TextEditingController();
  bool colorChane = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        "Feedback",
        style:
            textTheme(context).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _feedbackController,
            decoration: InputDecoration(
              labelText: "Enter your feedback",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            maxLines: 4,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  colorChane = !colorChane;
                });
                String feedback = _feedbackController.text.trim();
                print("Feedback submitted: $feedback");

                context.pop();
              },
              child: Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                      color: colorChane == true
                          ? colorScheme(context).primary
                          : colorScheme(context).onPrimary,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: colorScheme(context).primary)),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: textTheme(context).bodyMedium?.copyWith(
                          color: colorChane == true
                              ? colorScheme(context).onPrimary
                              : colorScheme(context).onSurface),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
