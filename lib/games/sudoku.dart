import 'package:flutter/material.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

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

  // Tạo bảng cho từng dif
  void _selectDifficulty(String difficulty) {
    int emptyCount = 30; // Default: Easy
    
    if (difficulty == 'Medium') {emptyCount = 45;} 
    else if (difficulty == 'Asian') {emptyCount = 54;}

    setState(() {
      _generateBoard(emptyCount);
      showDifficultySelector = false;
    });
  }

  void _generateBoard(int emptySquares) {
    print('Ngủ đã');
  }


  // Xử lý khi người dùng chọn số từ number pad
  void _onNumberSelect(int num) {
    if (selectedRow == null || selectedCol == null) return;
    if (isFixed[selectedRow!][selectedCol!]) return;

    setState(() {
      board[selectedRow!][selectedCol!] = num;
      _checkErrors();

    });
  }
  void _checkErrors() {
    // Reset tất cả ô về không lỗi
    isError = List.generate(
      gridSize,
      (_) => List.filled(gridSize, false),
    );
    
    // Duyệt qua từng ô
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        final value = board[i][j];
        
        // Bỏ qua ô trống
        if (value == 0) continue;

        // Kiểm tra trùng trong hàng
        for (int k = 0; k < gridSize; k++) {
          if (k != j && board[i][k] == value) {
            // Đánh dấu lỗi nếu trùng số
            isError[i][j] = true;
            isError[i][k] = true;
          }
        }
        
        // Kiểm tra trùng trong cột
        for (int k = 0; k < gridSize; k++) {
          if (k != i && board[k][j] == value) {
            // Đánh dấu lỗi nếu trùng số
            isError[i][j] = true;
            isError[k][j] = true;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showDifficultySelector) {  // Menu chọn độ khó
      return Scaffold(
        appBar: AppBar(title: const Text('Sudoku')),
        backgroundColor: const Color(0xFF0F0F1E),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Chọn độ khó',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              _buildDifficultyButton('Dễ', Colors.green),
              const SizedBox(height: 16),
              _buildDifficultyButton('Trung bình', Colors.orange),
              const SizedBox(height: 16),
              _buildDifficultyButton('Asian', Colors.red),
            ],
          ),
        ),
      );
    }

    // Màn hình game
    const double cellSize = 35;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudoku 9x9'),
      ),
      backgroundColor: const Color(0xFF0F0F1E),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // Bảng Sudoku 9x9
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 9, // 9 cột
                    childAspectRatio: 1, // ô vuông
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: 81, // 9x9 = 81 ô
                  itemBuilder: (ctx, index) {
                    int row = index ~/ 9; // Hàng
                    int col = index % 9;  // Cột

                    return Container(
                      width: cellSize,
                      height: cellSize,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F0F1E),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          // Hiển thị số, hoặc rỗng nếu = 0
                          board[row][col] == 0 
                              ? '' 
                              : board[row][col].toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }


  /// Widget menu chọn độ khó
  Widget _buildDifficultyButton(String difficulty, Color color) {
    return ElevatedButton(
      onPressed: () => _selectDifficulty(difficulty),

      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A1A2E),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              difficulty,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.grid_4x4, color: color, size: 24),
            ),
          ],
        ),
      ),
    );
  }

}