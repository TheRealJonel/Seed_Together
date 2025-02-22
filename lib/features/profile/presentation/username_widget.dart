import 'package:flutter/material.dart';

/// **UsernameWidget** - Zeigt den Benutzernamen mit optionalem Bearbeiten-Button
class UsernameWidget extends StatelessWidget {
  final String username;
  final VoidCallback? onEdit;

  const UsernameWidget({Key? key, required this.username, this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          username,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (onEdit != null) ...[
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.edit, size: 18),
            onPressed: onEdit,
          ),
        ],
      ],
    );
  }
}
