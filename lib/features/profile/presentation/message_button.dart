import 'package:flutter/material.dart';

/// **MessageButton** - Blauer Nachrichten-Button
class MessageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MessageButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.message, color: Colors.blue, size: 28),
      onPressed: onPressed,
    );
  }
}
