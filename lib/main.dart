import 'package:flutter/material.dart';
import 'login/LoginScreen.dart';

void main() {
  runApp(MaterialApp(home: LoginScreen()));
}

class GamePlatformApp extends StatelessWidget {
  const GamePlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A2E),
          elevation: 0,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
