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

      body: Container(),
    );
  }
}
