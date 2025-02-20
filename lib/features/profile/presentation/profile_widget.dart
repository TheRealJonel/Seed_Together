import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/// **ProfileWidget** - Benutzerprofil-Widget
/// UI bleibt **exakt** wie vorher, nur mit der Möglichkeit, ein Bild hochzuladen.
class ProfileWidget extends StatefulWidget {
  final String username;
  final String profileImageUrl;
  final int followers;
  final int following;
  final VoidCallback onEdit;
  final VoidCallback onMessage;

  const ProfileWidget({
    Key? key,
    required this.username,
    required this.profileImageUrl,
    required this.followers,
    required this.following,
    required this.onEdit,
    required this.onMessage,
  }) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  File? _image; // Lokales Bild

  /// **_pickImage** - Wählt ein Bild oder macht ein Foto
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  /// **_showImagePicker** - Zeigt das Menü zur Bildauswahl
  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Galerie auswählen'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Foto aufnehmen'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
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
        borderRadius: BorderRadius.circular(20),
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
          /// **Profilbereich mit Bild, Name & Icons**
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// **Profilbild mit Klick für Upload**
              GestureDetector(
                onTap: _showImagePicker,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _image != null
                      ? FileImage(_image!) // Neues Bild aus der Galerie
                      : NetworkImage(widget.profileImageUrl) as ImageProvider,
                  child: _image == null
                      ? const Icon(Icons.camera_alt, size: 40, color: Colors.white)
                      : null,
                ),
              ),
              const SizedBox(width: 12),

              /// **Benutzernamen & Bearbeiten-Button**
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.username,
                          style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.edit, size: 18),
                          onPressed: widget.onEdit,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    /// **Follower & Following Statistiken**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _StatItem(icon: Icons.person, label: "Follower", count: widget.followers),
                        _StatItem(icon: Icons.person_add, label: "Following", count: widget.following),

                        /// **Nachrichtensymbol (Höher gesetzt)**
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: IconButton(
                            icon: const Icon(Icons.message, color: Colors.blue, size: 28),
                            onPressed: widget.onMessage,
                          ),
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

/// **_StatItem** - Widget für die Follower/Following Anzeige
class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;

  const _StatItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 22),
        const SizedBox(height: 4),
        Text("$count", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
