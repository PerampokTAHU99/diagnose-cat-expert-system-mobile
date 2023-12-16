import 'package:catcare_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';

import '../middleware/base_client.dart';
import '../middleware/secure_storage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isAllowed = true;
  String message = "";

  Future<bool> login(String username, String password) async {
    Map<String, dynamic> jsonData = await BaseClient().post(
      "/auth/login/",
      body: {
        'username': username,
        'password': password
      }
    );

    message = jsonData['message'];

    if (jsonData['status'] != 200) {
      return false;
    }

    if (jsonData['result']['roleId'] != "4003") {
      isAllowed = false;
    }
    else {
      isAllowed = true;
    }

    SecureStorage().writeToken(key: 'token', value: jsonData['token']);

    return true;
  }

  Future<void> _showWarningDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Fitur belum tersedia",
            style: TextStyle(
              fontSize: 14
            ),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "Untuk Admin, Dokter atau konsultan lainnya, harap gunakan "
                  "aplikasi versi Web untuk akses.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(color: Theme.of(context).colorScheme.secondary,),
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Login CatCare App"),
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("img/cat.png"),
                const SizedBox(width: 15,),
                Stack(
                  children: [
                    Text(
                      "E-Clinic",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.white,
                      ),
                    ),
                    const Text(
                      "E-Clinic",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            offset: Offset(-1, 3),
                            color: Colors.black45,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              height: 115,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0)
                    ),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0)
                    ),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          Snackbar(text: "Username atau Password tidak boleh kosong."),
                        );

                        return;
                      }

                      bool isLoggedIn = await login(
                        usernameController.text,
                        passwordController.text
                      );

                      if (mounted) {
                        if (isLoggedIn) {
                          if (isAllowed) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              "/home",
                              (context) => false,
                            );

                            return;
                          }

                          return _showWarningDialog(context);
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          Snackbar(text: message),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  const Text("Belum punya akun?"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/register");
                    },
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Daftar",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
