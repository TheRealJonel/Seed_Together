import 'package:flutter/material.dart';
import 'package:seed_together/features/profile/domain/user_model.dart';
import 'profile_image.dart';

class ProfileWidget extends StatelessWidget {
  final UserModel user;
  final int followers;
  final int following;
  final VoidCallback onEdit;
  final VoidCallback onMessage;

  const ProfileWidget({
    required this.user,
    required this.followers,
    required this.following,
    required this.onEdit,
    required this.onMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aboutMeController = TextEditingController(text: user.aboutMe ?? '');
    final locationController = TextEditingController(text: user.location ?? '');
    final gardenTypeController = TextEditingController(text: user.gardenType ?? '');
    final preferredPlantsController = TextEditingController(text: user.preferredPlants ?? '');
    final gardeningStyleController = TextEditingController(text: user.gardeningStyle ?? '');

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          ProfileImage(imageUrl: user.username),
          const SizedBox(height: 10),
          Text(user.username, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [Text('Followers'), Text(followers.toString())]),
              Column(children: [Text('Following'), Text(following.toString())]),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: onEdit, child: const Text("Profil bearbeiten")),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: onMessage, child: const Text("Nachricht senden")),
          const SizedBox(height: 30),
          _buildInfoField("Über mich", aboutMeController),
          _buildInfoField("Ort", locationController),
          _buildInfoField("Gartentyp", gardenTypeController),
          _buildInfoField("Bevorzugte Pflanzen", preferredPlantsController),
          _buildInfoField("Gartenstil", gardeningStyleController),
        ],
      ),
    );
  }

  Widget _buildInfoField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }
}
