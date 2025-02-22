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
    // TextEditingController für alle Felder erstellen
    TextEditingController usernameController = TextEditingController(text: user.username);
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
            /// **Profilbild aktualisieren**
            ProfileImage(imageUrl: user.username), // Hier kannst du auch die tatsächliche Bild-URL einfügen
            const SizedBox(height: 20),
            /// **Benutzernamen ändern**
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Benutzername",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            /// **Ort eingeben**
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: "Ort",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            /// **Gartentyp eingeben**
            TextField(
              controller: gardenTypeController,
              decoration: InputDecoration(
                labelText: "Gartentyp",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            /// **Bevorzugte Pflanzen eingeben**
            TextField(
              controller: preferredPlantsController,
              decoration: InputDecoration(
                labelText: "Bevorzugte Pflanzen",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            /// **Gartenstil / Erfahrung eingeben**
            TextField(
              controller: gardeningStyleController,
              decoration: InputDecoration(
                labelText: "Gartenstil / Erfahrung",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            /// **Speichern-Button**
            ElevatedButton.icon(
              onPressed: () {
                // Hier können die neuen Daten gespeichert werden
                debugPrint("Neuer Name: ${usernameController.text}");
                debugPrint("Ort: ${locationController.text}");
                debugPrint("Gartentyp: ${gardenTypeController.text}");
                debugPrint("Bevorzugte Pflanzen: ${preferredPlantsController.text}");
                debugPrint("Gartenstil: ${gardeningStyleController.text}");
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UsernameWidget(
                          username: user.username,
                          onEdit: () => _showProfileEditSheet(context),
                        ),
                      ],
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
