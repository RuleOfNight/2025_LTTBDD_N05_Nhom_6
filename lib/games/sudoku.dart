import 'package:flutter/material.dart';

class SudokuGame extends StatefulWidget {
  const SudokuGame({Key? key}) : super(key: key);

  @override
  State<SudokuGame> createState() => _SudokuGameState();
}

// ...existing code...

class _SudokuGameState extends State<SudokuGame> {
  bool showDifficultySelector = true;

  void _selectDifficulty(String difficulty) {
    // Placeholder for difficulty selection logic
    setState(() {
      showDifficultySelector = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showDifficultySelector) {
      return Scaffold(
        appBar: AppBar(title: const Text('Sudoku')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Chọn độ khó',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              _buildDifficultyButton('Easy', Colors.green),
              const SizedBox(height: 16),
              _buildDifficultyButton('Medium', Colors.orange),
              const SizedBox(height: 16),
              _buildDifficultyButton('Asian', Colors.red),
            ],
          ),
        ),
      );
    }

    return const Scaffold(
      body: Center(child: Text('Game Placeholder')),
    );
  }

  Widget _buildDifficultyButton(String difficulty, Color color) {
    return ElevatedButton(
      onPressed: () => _selectDifficulty(difficulty),
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.3),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      ),
      child: Text(
        difficulty,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}