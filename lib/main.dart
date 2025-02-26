import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/profile/presentation/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Wichtig für async Code in main()

  await Supabase.initialize(
    url: 'https://lrmsmnnlxizcbvxncxjr.supabase.co', // Ersetze mit deiner echten Supabase-URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxybXNtbm5seGl6Y2J2eG5jeGpyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA1NzI5NzgsImV4cCI6MjA1NjE0ODk3OH0.yLJ6nuhiNgcM231ddlBy5hJVg2nPPFN7NSuy9bIpExE', // Ersetze mit deinem Supabase Anon-Key
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
