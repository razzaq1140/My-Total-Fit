import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final int currentStep; // The current step user is on
  final int totalSteps; // Total number of steps

  const CustomProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSteps, (index) {
          final isActive = index < currentStep;

          return SizedBox(
            width: (screenWidth - 32) / totalSteps,
            child: Row(
              children: [
                // Step container
                Expanded(
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.red : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Colors.red : Colors.grey.shade300,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
                const SizedBox(width: 2),
              ],
            ),
          );
        }),
      ),
    );
  }
}
