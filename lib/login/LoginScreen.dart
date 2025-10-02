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
            TextFormField(
              onChanged: (value) => print(value),
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
