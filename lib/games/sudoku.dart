import 'package:flutter/material.dart';


class SudokuGame extends StatefulWidget {
  const SudokuGame({Key? key}) : super(key: key);

  @override
  State<SudokuGame> createState() => _SudokuGameState();
}

class _SudokuGameState extends State<SudokuGame> {
  static const int gridSize = 9;
  List<List<int>> board = []; // board
  List<List<bool>> isFixed = []; // Đánh dấu ô gốc (chứa số mà chương trình tạo sẵn)
  List<List<bool>> isError = []; // Ô lỗi
  List<List<int>> solution = []; // đáp án
  
  // Menu chọn độ khó
  bool showDifficultySelector = true;
  
  // Ô đang được chọn
  int? selectedRow;
  int? selectedCol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sudoku')),
      backgroundColor: const Color(0xFF0F0F1E),
      body: const Center(
        child: Text(
          'Placeholder',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}