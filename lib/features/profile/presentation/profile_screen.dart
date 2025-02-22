import 'package:flutter/material.dart';
import 'package:seed_together/features/profile/presentation/profile_widget.dart';

/// **ProfileScreen** - Hauptbildschirm für das Benutzerprofil
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          ProfileWidget(
            username: "Janngo",
            profileImageUrl: "https://via.placeholder.com/150",
            followers: 120,
            following: 80,
            onEdit: () {
              debugPrint("Profil bearbeiten");
            },
            onMessage: () {
              debugPrint("Nachricht senden");
            },
          ),
        ],
      ),
    );
  }
}
