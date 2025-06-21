import 'package:flutter/material.dart';
import 'package:upasthiti/screens/login.dart';
import 'package:upasthiti/screens/subjects.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xFF121212), // Dark background
      primaryColor: Colors.tealAccent[200],
      colorScheme: ColorScheme.dark(
        primary: Colors.tealAccent,
        secondary: Colors.teal,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
        bodyMedium: TextStyle(color: Colors.white70),
        headlineMedium: TextStyle(
          color: Colors.tealAccent,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF121212),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFF1E1E1E),
        hintStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.tealAccent),
        ),
      ),
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'Upasthiti',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: darkTheme,
      home: const Subjects(),
    );
  }
}
