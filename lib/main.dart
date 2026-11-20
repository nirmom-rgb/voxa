import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VoxaApp());
}

class VoxaApp extends StatelessWidget {
  const VoxaApp({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF080D18);
    return MaterialApp(
      title: 'VOXA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF28B8F2),
          secondary: Color(0xFF68D5FF),
          surface: Color(0xFF111B2C),
          error: Color(0xFFFF647C),
        ),
        fontFamily: 'Roboto',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF111B2C),
          hintStyle: const TextStyle(color: Color(0xFF78869B)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF25334A)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF25334A)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF28B8F2), width: 1.4),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
