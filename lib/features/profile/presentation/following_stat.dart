import 'package:flutter/material.dart';

/// **FollowingStat** - Zeigt die Anzahl der folgenden Nutzer mit Icon
class FollowingStat extends StatelessWidget {
  final int count;

  const FollowingStat({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.person_add, size: 22),
        const SizedBox(height: 4),
        Text(
          "$count",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Text(
          "Following",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
