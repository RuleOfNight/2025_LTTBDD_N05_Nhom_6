import 'package:flutter/material.dart';
import '../games/tictoc.dart';
import '../games/sudoku.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Scaffold tạo bố cục cơ bản cho 1 màn hình (headbar + body)
        appBar: AppBar(
            title: const Text('GameHub', style: TextStyle(fontWeight: FontWeight.bold)),
            actions: [
                // Nút thông báo ở góc phải headbar
                IconButton(icon: const Icon(Icons.notifications), onPressed: () {
                // lazy
                }),
            ],
        ),
        body: SingleChildScrollView(
            // Scroll
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    _buildFeaturedBanner(context),
                    _buildSectionTitle('Featured Games'),
                    _buildQuickPlayGames(context),
                    const SizedBox(height: 20),    // Khoảng cách dưới các banner
                ],
            ),
        ),
    );
  }

  // Banner
  Widget _buildFeaturedBanner(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                colors: [Color(0xFF6B46C1), Color(0xFF9333EA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            ),
        ),
        child: Stack(
            children: [
                // Icon
                Positioned(
                    right: -20,
                    top: -20,
                    child: Icon(Icons.sports_esports, size: 180, color: Colors.white.withOpacity(0.1)), // Icon là có sẵn trong thư viện material của flutter
                ),
                // text trong banner
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                            Text(
                                'Chào mừng đến GameHub',
                                style: TextStyle(fontSize: 16, color: Colors.white70),
                            ),
                            SizedBox(height: 8),
                            Text(
                                'Bạn cần đạt 5tr sức mạnh\ntrong Rise Of Kingdoms để skip QC',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                        ],
                    ),
                ),
            ],
        ),
    );
  }

 // Title
  Widget _buildSectionTitle(String title) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
    );
  }

 // Grid các game
  Widget _buildQuickPlayGames(BuildContext context) {
    final games = [
        {
            'name': 'Tic Tac Toe',
            'icon': Icons.grid_3x3,
            'color': Colors.blue,
            'screen': const TicTocGame()
        },
        {
            'name': 'Rắn Săn Mồi',
            'icon': Icons.widgets,
            'color': Colors.green,
            'screen': const Placeholder()
        },
        {
            'name': 'Card Game',
            'icon': Icons.extension,
            'color': Colors.orange,
            'screen': const Placeholder()
        },
        {
            'name': 'Sudoku',
            'icon': Icons.calculate,
            'color': Colors.teal,
            'screen': const SudokuGame()
        },
    ];

    // Display grid game theo 2 cột
    return GridView.builder(
        shrinkWrap: true, // co lại theo nội dung nó chứa thay vì chiếm toàn bộ height
        physics: const NeverScrollableScrollPhysics(), // Tắt scroll riêng, vì GridView nằm trong SingleChildScrollView bên ngoài
        padding: const EdgeInsets.symmetric(horizontal: 16), // Lề trái/phải
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,       // Số cột = 2
            childAspectRatio: 1.1,   // Tỉ lệ khung (width/height). >1: ngang rộng hơn cao
            crossAxisSpacing: 12,    // Khoảng cách giữa các cột
            mainAxisSpacing: 12,     // Khoảng cách giữa các hàng
        ),
        itemCount: games.length,   // Số item trong grid = số game trong list games
        itemBuilder: (ctx, i) {
            return InkWell( // InkWell = opTap + hiệu ứng ripple   để bắt sk
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => games[i]['screen'] as Widget),
                    );
                },
                child: Container(
                    // Khung chứa 1 ô game
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16), // Bo góc
                        gradient: LinearGradient(
                            colors: [
                            (games[i]['color'] as Color).withOpacity(0.6),
                            (games[i]['color'] as Color).withOpacity(0.3),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                        ),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Căn center theo chiều dọc
                        children: [
                            Icon(
                                games[i]['icon'] as IconData, // Icon game
                                size: 50,
                                color: Colors.white,
                            ),
                            const SizedBox(height: 12), // Khoảng cách giữa icon với text
                            Text(
                                games[i]['name'] as String, // Tên game
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                            ),
                        ],
                    ),
                ),
            );
        },
    );
  }
}
