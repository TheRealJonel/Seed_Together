import 'package:flutter/material.dart';
import 'profile_widget.dart';

/// **ProfileScreen** - Hauptbildschirm für das Benutzerprofil
/// Hier wird das `ProfileWidget` aufgerufen und mit den notwendigen Parametern befüllt.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Hintergrundfarbe des Screens
      body: Column(
        children: [
          ProfileWidget(
            username: "Janngo", // Beispiel-Username
            profileImageUrl: "https://via.placeholder.com/150", // Standardbild als Fallback
            followers: 120, // Anzahl der Follower
            following: 80, // Anzahl der Personen, denen gefolgt wird
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
