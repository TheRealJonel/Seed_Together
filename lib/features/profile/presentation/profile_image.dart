import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/// **ProfileImage** - Widget für das Profilbild mit Upload-Funktion
class ProfileImage extends StatefulWidget {
  final String imageUrl;

  const ProfileImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? _image;
  final picker = ImagePicker();

  /// **Bild aus Galerie oder Kamera auswählen**
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  /// **Dialog für Bildauswahl anzeigen**
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
                onTap: () => _pickImage(ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Foto aufnehmen'),
                onTap: () => _pickImage(ImageSource.camera),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showImagePicker,
      child: CircleAvatar(
        radius: 55,
        backgroundColor: Colors.grey[300],
        backgroundImage: _image != null
            ? FileImage(_image!) as ImageProvider
            : NetworkImage(widget.imageUrl),
        child: _image == null
            ? const Icon(Icons.camera_alt, size: 40, color: Colors.white)
            : null,
      ),
    );
  }
}
