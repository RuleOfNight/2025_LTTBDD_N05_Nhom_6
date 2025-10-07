import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'GameScreen.dart';
import 'LeaderBoard.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const GameScreen(),
    const LeaderboardScreen(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        // Navbar
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF1A1A2E),
          selectedItemColor: Colors.purpleAccent,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Games'),
<<<<<<< HEAD
            BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
=======
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'History',
            ),
>>>>>>> origin/main
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Dev Team'),
          ],
        ),
      ),
    );
  }
}
