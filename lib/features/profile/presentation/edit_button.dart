import 'package:flutter/material.dart';

/// **EditButton** - Kleines Stift-Icon zum Bearbeiten
class EditButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EditButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit, size: 18),
      onPressed: onPressed,
    );
  }
}
