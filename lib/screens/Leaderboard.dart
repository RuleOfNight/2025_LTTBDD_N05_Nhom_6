import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  Widget build(BuildContext context) {
    const finalLeaderboard = [
      {
        'rank': 1,
        'name': 'Cao Thủ 123',
        'score': 9542,
        'avatar': 'https://example.com/images/trophy.png',
      },
      {
        'rank': 2,
        'name': 'Ninja Siêu Đẳng',
        'score': 8935,
        'avatar': 'https://example.com/images/lightning.png',
      },
      {
        'rank': 3,
        'name': 'Thánh Game',
        'score': 8720,
        'avatar': 'https://example.com/images/controller.png',
      },
      {
        'rank': 4,
        'name': 'Bắn Tỉa',
        'score': 8210,
        'avatar': 'https://example.com/images/target.png',
      },
      {
        'rank': 5,
        'name': 'Chạy Nhanh',
        'score': 7890,
        'avatar': 'https://example.com/images/rocket.png',
      },
      {
        'rank': 6,
        'name': 'Thợ Pixel',
        'score': 7530,
        'avatar': 'https://example.com/images/sparkle.png',
      },
      {
        'rank': 7,
        'name': 'Sát Thủ Bóng Đêm',
        'score': 7300,
        'avatar': 'https://example.com/images/assassin.png',
      },
      {
        'rank': 8,
        'name': 'Bậc Thầy Combo',
        'score': 7105,
        'avatar': 'https://example.com/images/combo.png',
      },
      {
        'rank': 9,
        'name': 'Xạ Thủ Ảo Diệu',
        'score': 6880,
        'avatar': 'https://example.com/images/sniper.png',
      },
      {
        'rank': 10,
        'name': 'Phù Thủy Điện',
        'score': 6700,
        'avatar': 'https://example.com/images/wizard.png',
      },
      {
        'rank': 11,
        'name': 'Chiến Thần',
        'score': 6555,
        'avatar': 'https://example.com/images/warrior.png',
      },
      {
        'rank': 12,
        'name': 'Thần Tốc',
        'score': 6380,
        'avatar': 'https://example.com/images/fast.png',
      },
      {
        'rank': 13,
        'name': 'Kỹ Sư Game',
        'score': 6200,
        'avatar': 'https://example.com/images/engineer.png',
      },
      {
        'rank': 14,
        'name': 'Thám Tử 8x',
        'score': 6050,
        'avatar': 'https://example.com/images/detective.png',
      },
      {
        'rank': 15,
        'name': 'Lính Đánh Thuê',
        'score': 5900,
        'avatar': 'https://example.com/images/mercenary.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bảng Xếp Hạng'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: finalLeaderboard.length,
              itemBuilder: (context, index) {
                final player = finalLeaderboard[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A2E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text(
                        '#${player['rank']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
