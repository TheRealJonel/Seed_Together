import 'package:flutter/material.dart';
import 'package:seed_together/features/profile/presentation/profile_image.dart';
import 'package:seed_together/features/profile/presentation/username_widget.dart';
import 'package:seed_together/features/profile/presentation/edit_button.dart';
import 'package:seed_together/features/profile/presentation/follower_stat.dart';
import 'package:seed_together/features/profile/presentation/following_stat.dart';
import 'package:seed_together/features/profile/presentation/message_button.dart';
import 'package:seed_together/features/profile/presentation/custom_bottom_sheet.dart';
import 'package:seed_together/models/user_model.dart';

/// **ProfileWidget** - Kombiniert Profilbild, Name und Stats
class ProfileWidget extends StatelessWidget {
  final UserModel user;
  final int followers;
  final int following;
  final VoidCallback onEdit;
  final VoidCallback onMessage;

  const ProfileWidget({
    Key? key,
    required this.user,
    required this.followers,
    required this.following,
    required this.onEdit,
    required this.onMessage,
  }) : super(key: key);

  /// **Zeigt das Profil-Bearbeiten-BottomSheet an**
  void _showProfileEditSheet(BuildContext context) {
    TextEditingController aboutMeController = TextEditingController(text: user.aboutMe ?? '');
    TextEditingController locationController = TextEditingController(text: user.location ?? '');
    TextEditingController gardenTypeController = TextEditingController(text: user.gardenType ?? '');
    TextEditingController preferredPlantsController = TextEditingController(text: user.preferredPlants ?? '');
    TextEditingController gardeningStyleController = TextEditingController(text: user.gardeningStyle ?? '');

    showCustomBottomSheet(
      context: context,
      title: "Profil bearbeiten",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImage(imageUrl: user.username),
            const SizedBox(height: 10),

            Text(
              user.username,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Über mich",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: aboutMeController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                hintText: "Schreibe etwas über dich...",
              ),
            ),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ort",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Gartentyp",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: gardenTypeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Bevorzugte Pflanzen",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: preferredPlantsController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Gartenstil / Erfahrung",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: gardeningStyleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                debugPrint("Über mich: ${aboutMeController.text}");
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check, color: Colors.white),
              label: const Text("Speichern", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 50),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImage(imageUrl: "https://via.placeholder.com/150"),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UsernameWidget(
                      username: user.username,
                      onEdit: () => _showProfileEditSheet(context),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FollowerStat(count: followers),
                        FollowingStat(count: following),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: MessageButton(onPressed: onMessage),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
