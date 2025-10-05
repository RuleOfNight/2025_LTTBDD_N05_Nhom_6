import 'package:flutter/material.dart';

class TicTocGame extends StatefulWidget {
  const TicTocGame({super.key});

  @override
  State<TicTocGame> createState() => _TicTocGameState();
}

class _TicTocGameState extends State<TicTocGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1E),
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Lượt hiện tại",
                      style: TextStyle(color: Colors.grey[300], fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
