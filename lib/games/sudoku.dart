import 'package:flutter/material.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

class SudokuGame extends StatefulWidget {
  const SudokuGame({Key? key}) : super(key: key);

  @override
  State<SudokuGame> createState() => _SudokuGameState();
}

class _SudokuGameState extends State<SudokuGame> {
  static const int gridSize = 9;
  List<List<int>> board = [];
  List<List<int>> solution = [];
  bool showDifficultySelector = true;

  void _generateBoard(int emptySquares) {
    final generator = SudokuGenerator(
      emptySquares: emptySquares.clamp(0, 54),
    );

    final puzzle = generator.newSudoku;
    final solved = generator.newSudokuSolved;

    board = List.generate(gridSize, (i) => List<int>.from(puzzle[i]));
    solution = List.generate(gridSize, (i) => List<int>.from(solved[i]));
  }

  void _selectDifficulty(String difficulty) {
    int emptyCount = 30;
    if (difficulty == 'Medium') emptyCount = 45;
    else if (difficulty == 'Asian') emptyCount = 60;

    setState(() {
      _generateBoard(emptyCount);
      showDifficultySelector = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Menu chọn độ khó
    if (showDifficultySelector) {
      return Scaffold(
        appBar: AppBar(title: const Text('Sudoku')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Chọn độ khó', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Sudoku')),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridSize,
            childAspectRatio: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: gridSize * gridSize,
          itemBuilder: (ctx, index) {
            int row = index ~/ gridSize;
            int col = index % gridSize;

            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  board.isNotEmpty && board[row][col] != 0
                      ? board[row][col].toString()
                      : '',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
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