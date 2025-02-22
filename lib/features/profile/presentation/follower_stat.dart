import 'package:flutter/material.dart';

/// **FollowerStat** - Zeigt die Anzahl der Follower mit Icon
class FollowerStat extends StatelessWidget {
  final int count;

  const FollowerStat({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.person, size: 22),
        const SizedBox(height: 4),
        Text(
          "$count",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Text(
          "Follower",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
