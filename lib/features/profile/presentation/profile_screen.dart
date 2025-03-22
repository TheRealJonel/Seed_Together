import 'package:flutter/material.dart';
import 'package:seed_together/features/profile/presentation/profile_widget.dart';
import 'package:seed_together/features/profile/domain/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final demoUser = UserModel(
      username: "Janngo",
      aboutMe: "Ich liebe Urban Gardening!",
      location: "Berlin",
      gardenType: "Balkon",
      preferredPlants: "Tomaten, Kräuter",
      gardeningStyle: "Natürlich",
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Profil")),
      body: ProfileWidget(
        user: demoUser,
        followers: 120,
        following: 75,
        onEdit: () {
          // TODO: Bearbeitungslogik
        },
        onMessage: () {
          // TODO: Nachrichtenlogik
        },
      ),
    );
  }
}
