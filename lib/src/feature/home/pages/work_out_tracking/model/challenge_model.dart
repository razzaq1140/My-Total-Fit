import 'package:flutter/material.dart';

class ChallengeModel {
  final String title;
  final String description;
  final String category;
  final Color color;

  ChallengeModel({
    required this.title,
    required this.description,
    required this.category,
    required this.color,
  });
}

List<ChallengeModel> challengeList = [
  ChallengeModel(
    title: "FULL BODY WORKOUT",
    description:
        "A full-body workout targets all major muscle groups, combining strength, endurance, and flexibility exercises for a complete fitness routine.",
    category: "Full Body",
    color: Colors.red,
  ),
  ChallengeModel(
    title: "UPPER BODY WORKOUT",
    description:
        "An upper-body workout targets all major muscle groups, combining strength, endurance, and flexibility exercises for a complete fitness routine.",
    category: "Upper Body",
    color: Colors.amber,
  ),
];
