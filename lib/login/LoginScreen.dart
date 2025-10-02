import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Scaffold là widget cung cấp cấu trúc cơ bản cho một màn hình
    return Scaffold(
      // Khi bàn phím bật, Scaffold KHÔNG co lại body
      resizeToAvoidBottomInset: false,
      // Có SingleChildScrollView → khi bàn phím bật, người dùng có thể scroll xuống để bấm nút Login
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Ô nhập Email
            TextFormField(
              controller: emailController,
              onChanged: (value) => print("Email: $value"),
              decoration: const InputDecoration(labelText: "Email"),
            ),

            // Ô nhập Password
            TextFormField(
              controller: passController,
              obscureText: true, // ẩn ký tự
              onChanged: (value) => print("Password: $value"),
              decoration: const InputDecoration(labelText: "Password"),
            ),
          ],
        ),
      ),
    );
  }
}
