import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  Widget build(BuildContext context) {
    final finalLeaderboard = [
      {
        'rank': 1,
        'name': 'Cao Thủ 123',
        'score': 9542,
        'avatar':
            'https://th.bing.com/th/id/R.2d1bf50167bbc01e5720092084ee3bf9?rik=xB9kSLFCBDfcOA&riu=http%3a%2f%2fthuthuatphanmem.vn%2fuploads%2f2018%2f09%2f11%2fhinh-anh-dep-6_044127357.jpg&ehk=g1hC5ADWBCALT4vPZWI4M%2fmjOeSVF32fzLUV6Iw7aN4%3d&risl=&pid=ImgRaw&r=0',
      },
      {
        'rank': 2,
        'name': 'Ninja Siêu Đẳng',
        'score': 8935,
        'avatar':
            'https://th.bing.com/th/id/R.2d1bf50167bbc01e5720092084ee3bf9?rik=xB9kSLFCBDfcOA&riu=http%3a%2f%2fthuthuatphanmem.vn%2fuploads%2f2018%2f09%2f11%2fhinh-anh-dep-6_044127357.jpg&ehk=g1hC5ADWBCALT4vPZWI4M%2fmjOeSVF32fzLUV6Iw7aN4%3d&risl=&pid=ImgRaw&r=0',
      },
      {
        'rank': 3,
        'name': 'Thánh Game',
        'score': 8720,
        'avatar':
            'https://th.bing.com/th/id/R.2d1bf50167bbc01e5720092084ee3bf9?rik=xB9kSLFCBDfcOA&riu=http%3a%2f%2fthuthuatphanmem.vn%2fuploads%2f2018%2f09%2f11%2fhinh-anh-dep-6_044127357.jpg&ehk=g1hC5ADWBCALT4vPZWI4M%2fmjOeSVF32fzLUV6Iw7aN4%3d&risl=&pid=ImgRaw&r=0',
      },
      {
        'rank': 4,
        'name': 'Bắn Tỉa',
        'score': 8210,
        'avatar':
            'https://th.bing.com/th/id/R.2d1bf50167bbc01e5720092084ee3bf9?rik=xB9kSLFCBDfcOA&riu=http%3a%2f%2fthuthuatphanmem.vn%2fuploads%2f2018%2f09%2f11%2fhinh-anh-dep-6_044127357.jpg&ehk=g1hC5ADWBCALT4vPZWI4M%2fmjOeSVF32fzLUV6Iw7aN4%3d&risl=&pid=ImgRaw&r=0',
      },
      {
        'rank': 5,
        'name': 'Chạy Nhanh',
        'score': 7890,
        'avatar':
            'https://th.bing.com/th/id/R.2d1bf50167bbc01e5720092084ee3bf9?rik=xB9kSLFCBDfcOA&riu=http%3a%2f%2fthuthuatphanmem.vn%2fuploads%2f2018%2f09%2f11%2fhinh-anh-dep-6_044127357.jpg&ehk=g1hC5ADWBCALT4vPZWI4M%2fmjOeSVF32fzLUV6Iw7aN4%3d&risl=&pid=ImgRaw&r=0',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bảng Xếp Hạng',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Podium(finalLeaderboard[0], 2, 100, Colors.yellow),
                Podium(finalLeaderboard[0], 1, 100, Colors.yellow),
                Podium(finalLeaderboard[0], 3, 100, Colors.yellow),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: finalLeaderboard.length,
              itemBuilder: (context, index) {
                final player = finalLeaderboard[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A2E),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(player['avatar'] as String),
                    ),
                    title: Text(
                      player['name'] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Hạng ${player['rank']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: Text(
                      '${player['score']} điểm',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
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

Widget Podium(
  Map<String, dynamic> player,
  int rank,
  double height,
  Color color,
) {
  return Column(
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(player['avatar'] as String),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: color, width: 3),
        ),
      ),
      Text(
        player['name'] as String,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      Text(
        'Điểm: ${player['score']}',
        style: const TextStyle(color: Colors.grey, fontSize: 11),
      ),
      const SizedBox(height: 8.0),
      Container(
        width: 150,
        height: height,
        decoration: BoxDecoration(
          color: color.withAlpha(90),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          border: Border.all(color: color),
        ),
        child: Center(
          child: Text(
            '#$rank',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ),
    ],
  );
}
