import 'package:flutter/material.dart';

class SudokuGame extends StatefulWidget {
  const SudokuGame({Key? key}) : super(key: key);

  @override
  State<SudokuGame> createState() => _SudokuGameState();
}

class _SudokuGameState extends State<SudokuGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sudoku')),
      body: const Center(
        child: Text('Chưa có đâu'),
      ),
    );
  }
}