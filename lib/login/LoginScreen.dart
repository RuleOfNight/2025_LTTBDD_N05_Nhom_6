import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:games_platform/screens/MainScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool hidePass = true;

  Artboard? artboard;
  SMITrigger? failTrigger;
  SMITrigger? successTrigger;
  SMIBool? isChecking;
  SMIBool? isHandsUp;
  SMINumber? numLook;
  SMIBool? isSeeking;

  StateMachineController? stateMachineController;

  var bearAnimation = "imgs/bear3.riv";

  @override
  void initState() {
    super.initState();
    _loadRive();
  }

  Future<void> _loadRive() async {
    await RiveFile.initialize();
    final data = await rootBundle.load(bearAnimation);
    final file = RiveFile.import(data);
    final art = file.mainArtboard;
    stateMachineController = StateMachineController.fromArtboard(
      art,
      "Login Machine",
    );

    if (stateMachineController != null) {
      art.addController(stateMachineController!);

      for (final element in stateMachineController!.inputs) {
        if (element.name == "isChecking") {
          isChecking = element as SMIBool;
        } else if (element.name == "numLook") {
          numLook = element as SMINumber;
        } else if (element.name == "isHandsUp") {
          isHandsUp = element as SMIBool;
        } else if (element.name == "trigSuccess") {
          successTrigger = element as SMITrigger;
        } else if (element.name == "trigFail") {
          failTrigger = element as SMITrigger;
        } else if (element.name == "isSeeking") {
          isSeeking = element as SMIBool;
        }
      }
    }
    setState(() {
      artboard = art;
    });
  }

  // void initState() {
  //   rootBundle.load(bearAnimation).then((value) {
  //     final file = RiveFile.import(value);
  //     final art = file.mainArtboard;
  //     stateMachineController = StateMachineController.fromArtboard(
  //       art,
  //       "Login Machine",
  //     );

  //     if (stateMachineController != null) {
  //       art.addController(stateMachineController!);

  //       stateMachineController!.inputs.forEach((element) {
  //         if (element.name == "isChecking") {
  //           isChecking = element as SMIBool;
  //         } else if (element.name == "numLook") {
  //           numLook = element as SMINumber;
  //         } else if (element.name == "isHandsUp") {
  //           isHandsUp = element as SMIBool;
  //         } else if (element.name == "trigSuccess") {
  //           successTrigger = element as SMITrigger;
  //         } else if (element.name == "trigFail") {
  //           failTrigger = element as SMITrigger;
  //         }
  //       });
  //     }
  //     setState(() {
  //       artboard = art;
  //     });
  //   });
  //   super.initState();
  // }

  void lookAround() {
    isChecking?.change(true);
    isHandsUp?.change(false);
    numLook?.change(0);
  }

  void handsUp() {
    isHandsUp?.change(true);
    isChecking?.change(false);
    numLook?.change(0);
  }

  void moveEyes(value) {
    numLook?.change(value);
  }

  void login() {
    isChecking?.change(false);
    isHandsUp?.change(false);
    isSeeking?.change(false);
    if (emailController.text == "admin" && passController.text == "admin") {
      successTrigger?.fire();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      failTrigger?.fire();
    }
  }

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
              // Bear Animation
              SizedBox(
                height: 500,
                width: 500,
                child: artboard == null
                    ? const SizedBox(height: 500, width: 500)
                    : Rive(artboard: artboard!),
              ),

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
                      onTap: lookAround,
                      controller: emailController,
                      onChanged: ((value) =>
                          moveEyes(value.length.toDouble() * 2)),
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
                      onTap: handsUp,
                      controller: passController,
                      obscureText: hidePass, // dùng biến thay vì true
                      onChanged: (value) => print("Password: $value"),
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Nhập password...",
                        icon: const Icon(Icons.lock),
                        focusColor: Colors.white,
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        // 👇 Thêm icon mắt để show/hide mật khẩu
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePass ? Icons.visibility_off : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              hidePass = !hidePass;
                              if (hidePass == false) {
                                isSeeking?.change(true);
                              } else {
                                isSeeking?.change(false);
                              }
                            });
                          },
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
              ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 55),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                  shadowColor: Colors.redAccent,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
