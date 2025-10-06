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

    /// Let me explain
    /// List trong Dart là kiểu tham chiếu (reference type)
    /// Ví dụ nếu code cho board tham chiếu trực tiếp đến puzzle thì khi thay đổi board thì puzzle cũng bị thay đổi theo
    /// Do đó cần tạo 1 bản sao (copy) của puzzle để board không bị ảnh hưởng khi thay đổi board
    ///   List<List<int>> puzzle = [[1, 2, 3]];
    ///   List<List<int>> board = puzzle; thì khi người chơi nhập số vào board thì puzzle gốc cũng bị thay đổi theo -> không bao giờ thắng được
    /// Giải pháp là tạo 1 List mới cho board và copy từng phần tử từ puzzle sang

    /// 1. List.generate(gridSize, ...)
    ///   Tạo 1 List mới có độ dài là gridSize (9)
    ///   Mỗi phần tử của List này là 1 List<int> mới được tạo ra bởi hàm bên trong

    /// 2. List<int>.from(puzzle[i])
    ///   Tạo 1 List<int> mới từ List<int> puzzle[i]
    ///   Đảm bảo board[i] là 1 List<int> hoàn toàn mới, không tham chiếu đến puzzle[i]
    ///   ví dụ: puzzle[0] = [1, 2, 3];
    ///         List<int>.from(puzzle[0])  // → [1, 2, 3], nhưng là list MỚI trong vùng nhớ

    /// 3. List.generate(...)
    ///   chạy 9 lần cho i từ 0 đến 8 để tạo 9 List<int> mới cho board, mỗi lần sẽ tạo 1 list con riêng, sau đó gom tất cả vào list lớn bên ngoài
    ///   kết quả: 
    ///       board = [
    ///         [copy của puzzle[0]],
    ///         [copy của puzzle[1]],
    ///         [copy của puzzle[2]],
    ///         ...
    ///       ]

    /// Nói chung là: 
    /// Layer tầng nông (List.generate) tạo khung 9 hàng
    /// Layer tầng sâu (List.from) sao chép từng hàng của puzzle chứ không tham chiếu trực tiếp tới puzzle



    // Số ô trống hợp lệ 0 -> 54 (cả matrix 9x9 có 81 ô, để lại ít nhất 27 ô có số mới đảm bảo cho ra nghiệm duy nhất có thể giải được)
    final capped = emptySquares.clamp(0, 54);

    // Gen board
    final generator = SudokuGenerator(
      emptySquares: capped,
      uniqueSolution: true,
    );

    final puzzle = generator.newSudoku; // Bảng chơi
    final solved = generator.newSudokuSolved; // Bảng đáp án

    board = List.generate(gridSize, (i) => List<int>.from(puzzle[i]),); // giải thích ở trên
    solution = List.generate(gridSize, (i) => List<int>.from(solved[i]),);
    
    // Đánh dấu các ô có số ban đầu là fixed (không sửa được)
    // Nếu puzzle[i][j] != 0 thì là số ban đầu
    isFixed = List.generate(gridSize, (i) => List.generate(gridSize, (j) => puzzle[i][j] != 0,),);
    
    // Khởi tạo mảng error (ban đầu không có lỗi nào)
    isError = List.generate(gridSize, (_) => List.filled(gridSize, false),);
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


  void _onCellTap(int row, int col) {
    // Không cho chọn ô đã có giá trị mà game khởi tạo
    if (isFixed[row][col]) return;
    
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
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
    const double cellSize = 35; // size mỗi ô

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudoku 9x9'),
      ),
      backgroundColor: const Color(0xFF0F0F1E),
      body: Center(
        child: SingleChildScrollView( // Widget cho phép scroll
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8), // Khoảng cách bên trong của bảng Sudoku
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // NeverScrollableScrollPhysics: tắt khả năng scroll của GridView
                  // Vì GridView nằm trong SingleChildScrollView, nên ta không muốn GridView tự cuộn
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 9, // Số cột trong GridView (9 cột cho Sudoku 9x9)
                    childAspectRatio: 1, // Tỷ lệ chiều rộng và chiều cao của mỗi ô (1:1 để ô vuông)
                    crossAxisSpacing: 2, // Khoảng cách ngang giữa các ô
                    mainAxisSpacing: 2, // Khoảng cách dọc giữa các ô
                  ),
                  itemCount: 81, // Tổng số ô (9x9 = 81)
                  itemBuilder: (ctx, index) {
                    int row = index ~/ 9; // Xác định hàng của ô (chia lấy phần nguyên)
                    int col = index % 9;  // Xác định cột của ô (chia lấy phần dư)
                    bool selected = selectedRow == row && selectedCol == col;

                    return GestureDetector(
                      onTap: () => _onCellTap(row, col),
                      child: Container(
                        width: cellSize,
                        height: cellSize,
                        decoration: BoxDecoration( // hightlight ô được chọn
                          color: isFixed[row][col]
                              ? Colors.grey.withOpacity(0.3)
                              : (selected
                                  ? Colors.purpleAccent.withOpacity(0.3)
                                  : const Color(0xFF0F0F1E)),
                          border: Border.all(
                            color: selected
                                ? Colors.purpleAccent
                                : Colors.grey.withOpacity(0.3),
                            width: selected ? 2 : 1,
                          ),
                        ),

                        child: Center(
                          child: Text(
                            board[row][col] == 0 
                                ? '' 
                                : board[row][col].toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isFixed[row][col]
                                  ? Colors.white
                                  : Colors.purpleAccent,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Text('Chọn số',style: TextStyle(fontSize: 18, color: Colors.white70),),
              const SizedBox(height: 10),
              // Number pad
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: List.generate(9, (i) => _buildNumberButton(i + 1),),
              ),
              const SizedBox(height: 10),
              _buildNumberButton(0, label: 'Xóa'),
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

  /// Widget numpad
  Widget _buildNumberButton(int num, {String? label}) { // label để hiển thị chữ thay vì số (dùng cho nút xóa)
    return ElevatedButton(
      onPressed: () {
        print('Selected: ${label ?? num}');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: num == 0 
            ? Colors.red.withOpacity(0.3) 
            : Colors.purpleAccent,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(50, 50),
      ),
      child: Text(
        label ?? num.toString(),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}