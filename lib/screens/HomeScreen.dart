import 'package:flutter/material.dart';

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
            child: Icon(Icons.sports_esports, size: 180, color: Colors.white.withOpacity(0.1)),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }



}
