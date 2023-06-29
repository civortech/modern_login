import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/account_page.dart';
import 'pages/login_page.dart';
import 'pages/sb_login_page.dart';
import 'pages/splash_page.dart';

const supabaseUrl = 'https://ihzcduuwtocihzlarjgh.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImloemNkdXV3dG9jaWh6bGFyamdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODgwNDU1OTgsImV4cCI6MjAwMzYyMTU5OH0.-_o-RUHcHjOtP2S7PlL1_vcoZGI7CrgNBMNWjOgmU68';
//const supabaseKey = String.fromEnvironment('SUPABASE_KEY')

Future<void> main() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    authFlowType: AuthFlowType.pkce,
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 1 == 2
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          )
        : MaterialApp(
            title: 'Supabase Flutter',
            theme: ThemeData.dark().copyWith(
              primaryColor: Colors.green,
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
              ),
            ),
            initialRoute: '/',
            routes: <String, WidgetBuilder>{
              '/': (_) => const SplashPage(),
              '/login': (_) => const SBLoginPage(),
              '/account': (_) => const AccountPage(),
            },
          );
  }
}
