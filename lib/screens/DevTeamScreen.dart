import 'package:flutter/material.dart';

class DevTeamScreen extends StatelessWidget {
  const DevTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: const Text(
          'Thông tin Nhóm',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
      ),
      // 1. Thêm SingleChildScrollView để có thể cuộn
      body: SingleChildScrollView(
        // 2. Thêm Column để xếp các widget theo chiều dọc
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
          children: [
            _buildTitle('Thông tin học phần'),
            _buildCourseInfo(),

            _buildTitle('Sinh viên thực hiện'),
            _buildDeveloperCard(
              name: 'Đào Mạnh Vương',
              mssv: '23010586',
              avatar: 'imgs/avatar_vuong.png',
              color: Colors.purple,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white70,
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF2A2A3E),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Học phần', 'Lập trình thiết bị di động'),
          _buildInfoRow('Mã học phần', 'CSE702027'),
          _buildInfoRow('Lớp', 'N05'),
          _buildInfoRow('Giảng viên', 'Ts. Nguyễn Xuân Quế'),
        ],
      ),
    );
  }

  Widget _buildDeveloperCard({
    required String name,
    required String mssv,
    required String avatar,
    required Color color,
  }) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                avatar,
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'MSSV: $mssv',
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
