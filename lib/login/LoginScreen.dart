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
        child: Center(
          child: Column(
            children: [
              // Ô nhập Email
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 400,
                  padding: const EdgeInsets.only(bottom: 10),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: emailController,
                      onChanged: (value) => print("Email: $value"),
                      decoration: const InputDecoration(
                        labelText: "Email",
                        hintText: "Nhập email...",
                        icon: Icon(Icons.email),
                        focusColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Ô nhập Password
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 400,
                  padding: const EdgeInsets.only(bottom: 10),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passController,
                      obscureText: true, // ẩn ký tự
                      onChanged: (value) => print("Password: $value"),
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Nhap password...",
                        icon: Icon(Icons.lock),
                        focusColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {},
                child: Text('Sign Up', style: TextStyle(color: Colors.white)),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
