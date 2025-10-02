import 'package:flutter/material.dart';
import 'login/LoginScreen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const GamePlatformApp());
}

class GamePlatformApp extends StatelessWidget {
  const GamePlatformApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A2E),
          elevation: 0,
        ),
      ),
      home: const MainScreen(),
    );
  }
}
