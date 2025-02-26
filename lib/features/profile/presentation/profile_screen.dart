import 'package:flutter/material.dart';
import 'package:seed_together/features/profile/presentation/profile_widget.dart';
import 'package:seed_together/models/user_model.dart';
import 'package:seed_together/features/profile/presentation/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// **ProfileScreen** - Hauptbildschirm für das Benutzerprofil
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void _logout(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
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
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  debugPrint("Speichern gedrückt");
                },
                child: Text("Speichern"),
              ),
              SizedBox(width: 10), // Abstand zwischen den Buttons
              ElevatedButton(
                onPressed: () => _logout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Roter Logout-Button
                ),
                child: Text("Logout"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
