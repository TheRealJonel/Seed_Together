import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app_links/app_links.dart';

import 'features/profile/presentation/login_screen.dart';
import 'features/profile/presentation/profile_screen.dart';
import 'password_reset_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLinks _appLinks;
  Widget _home = const LoginScreen();

  @override
  void initState() {
    super.initState();
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      _home = const ProfileScreen();
    }
    _setupDeepLinks();
  }

  void _setupDeepLinks() async {
    _appLinks = AppLinks();

    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null &&
          uri.path.contains('reset') &&
          uri.queryParameters.containsKey('access_token')) {
        final token = uri.queryParameters['access_token']!;
        setState(() {
          _home = PasswordResetScreen(accessToken: token);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeedTogether',
      debugShowCheckedModeBanner: false,
      home: _home,
    );
  }
}
