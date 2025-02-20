import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;

  const StatItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 22),
        const SizedBox(height: 4),
        Text(
          "$count",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
