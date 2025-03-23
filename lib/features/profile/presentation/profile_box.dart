import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileBox extends StatefulWidget {
  const ProfileBox({super.key});

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  String? imageUrl;

  Future<void> _pickAndUploadImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final compressed = await FlutterImageCompress.compressWithFile(
        pickedFile.path,
        quality: 70,
      );

      if (compressed != null) {
        final supabase = Supabase.instance.client;
        final userId = supabase.auth.currentUser?.id;
        final filePath = 'avatars/\.jpg';

        await supabase.storage.from('avatars').uploadBinary(
          filePath,
          compressed,
          fileOptions: const FileOptions(upsert: true),
        );

        final url = supabase.storage.from('avatars').getPublicUrl(filePath);
        setState(() => imageUrl = url);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 1. Profilbild mit Logik
          GestureDetector(
            onTap: _pickAndUploadImage,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
              child: imageUrl == null ? const Icon(Icons.camera_alt) : null,
            ),
          ),
          const SizedBox(height: 12),

          // 2. Username + Info-Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Janngo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  // TODO: BottomSheet öffnen – Profilinfos anzeigen/bearbeiten
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 3. Follower / Following
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                const Icon(Icons.person, color: Colors.blue),
                const Text("Follower"),
              ]),
              Column(children: [
                const Icon(Icons.person_add, color: Colors.blue),
                const Text("Following"),
              ]),
            ],
          ),
          const SizedBox(height: 16),

          // 4. Nachrichtenbutton
          IconButton(
            icon: const Icon(Icons.message_rounded, color: Colors.blue, size: 32),
            onPressed: () {
              // TODO: Direktnachricht öffnen
            },
          ),
        ],
      ),
    );
  }
}

  void _showProfileInfo(BuildContext context, {required bool isOwner}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: isOwner
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  TextField(decoration: InputDecoration(labelText: "Über mich")),
                  TextField(decoration: InputDecoration(labelText: "Standort")),
                  TextField(decoration: InputDecoration(labelText: "Gartentyp")),
                  TextField(decoration: InputDecoration(labelText: "Pflanzenvorlieben")),
                  TextField(decoration: InputDecoration(labelText: "Gartenstil")),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: null, child: Text("Speichern")),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  ListTile(title: Text("Über mich"), subtitle: Text("...")),
                  ListTile(title: Text("Standort"), subtitle: Text("...")),
                  ListTile(title: Text("Gartentyp"), subtitle: Text("...")),
                  ListTile(title: Text("Pflanzenvorlieben"), subtitle: Text("...")),
                  ListTile(title: Text("Gartenstil"), subtitle: Text("...")),
                ],
              ),
        );
      },
    );
  }

void _showUserList(BuildContext context, {required String title, required List<String> users}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...users.map((user) => ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(user),
              onTap: () {
                // TODO: Zur Profilseite des Users navigieren
              },
            )),
          ],
        ),
      );
    },
  );
}

void _showProfileInfoBottomSheet(BuildContext context, {required bool isCurrentUser}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Profilinformationen", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              enabled: isCurrentUser,
              decoration: const InputDecoration(labelText: "Über mich"),
              controller: TextEditingController(text: "Ich liebe Urban Gardening!"),
            ),
            TextField(
              enabled: isCurrentUser,
              decoration: const InputDecoration(labelText: "Ort"),
              controller: TextEditingController(text: "Berlin"),
            ),
            TextField(
              enabled: isCurrentUser,
              decoration: const InputDecoration(labelText: "Gartentyp"),
              controller: TextEditingController(text: "Balkon"),
            ),
            TextField(
              enabled: isCurrentUser,
              decoration: const InputDecoration(labelText: "Bevorzugte Pflanzen"),
              controller: TextEditingController(text: "Tomaten, Kräuter"),
            ),
            TextField(
              enabled: isCurrentUser,
              decoration: const InputDecoration(labelText: "Gartenstil"),
              controller: TextEditingController(text: "Natürlich"),
            ),
            if (isCurrentUser) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Daten speichern (Supabase)
                  Navigator.pop(context);
                },
                child: const Text("Speichern"),
              ),
            ],
          ],
        ),
      );
    },
  );
}
