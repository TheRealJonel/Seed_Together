import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PasswordResetScreen extends StatefulWidget {
  final String accessToken;

  const PasswordResetScreen({super.key, required this.accessToken});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final supabase = Supabase.instance.client;

  Future<void> updatePassword() async {
    try {
      await supabase.auth.updateUser(
        UserAttributes(password: _passwordController.text),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwort erfolgreich geändert!")),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Fehler: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Neues Passwort setzen")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Bitte neues Passwort eingeben:"),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Neues Passwort"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updatePassword,
              child: const Text("Passwort speichern"),
            ),
          ],
        ),
      ),
    );
  }
}
