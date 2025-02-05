import 'package:flutter/material.dart';

class ChallengeDetailsDialog extends StatefulWidget {
  final String imagePath;

  const ChallengeDetailsDialog({required this.imagePath, super.key});

  @override
  _ChallengeDetailsDialogState createState() => _ChallengeDetailsDialogState();
}

class _ChallengeDetailsDialogState extends State<ChallengeDetailsDialog> {
  String title = '';
  String challenge = '';
  int percentage = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enter Challenge Details"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Title"),
            onChanged: (value) => title = value,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Challenge"),
            onChanged: (value) => challenge = value,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Percentage"),
            keyboardType: TextInputType.number,
            onChanged: (value) => percentage = int.tryParse(value) ?? 0,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop({
              'title': title,
              'challenge': challenge,
              'percentage': percentage,
              'imageFile': widget.imagePath,
            });
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
