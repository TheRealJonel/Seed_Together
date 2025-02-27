import 'package:flutter/material.dart';
import 'package:seed_together/features/profile/presentation/profile_widget.dart';
import 'package:seed_together/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// **ProfileScreen** - Hauptbildschirm für das Benutzerprofil
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void _logout(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          ProfileWidget(
            user: UserModel(
              username: "Janngo",
              location: "Musterstadt",
              gardenType: "Balkon",
              preferredPlants: "Tomaten, Basilikum",
              gardeningStyle: "Urban Gardening",
            ),
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
