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

            _buildTitle('Sinh viên thực hiện'),
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
}
