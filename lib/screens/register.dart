import 'package:flutter/material.dart';

import '../middleware/base_client.dart';
import '../widgets/snackbar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = "";

  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String password
  }) async {
    Map<String, dynamic> jsonData = await BaseClient().post(
      "/data/users/",
      body: {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
        'roleId': 4003
      }
    );

    message = jsonData['message'];

    if (jsonData['status'] != 201) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Register CatCare App"),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                      prefixIcon: const Icon(Icons.person_4_outlined),
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
                  const SizedBox(height: 10,),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      prefixIcon: const Icon(Icons.person_outline),
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
                  const SizedBox(height: 10,),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "E-Mail",
                      prefixIcon: const Icon(Icons.mail_outline),
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
                  const SizedBox(height: 10,),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
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
                      if (nameController.text.isEmpty
                          || usernameController.text.isEmpty
                          || emailController.text.isEmpty
                          || passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          Snackbar(text: "Kolom tidak boleh ada yang kosong."),
                        );

                        return;
                      }

                      bool isRegistered = await register(
                        name: nameController.text,
                        username: usernameController.text,
                        email: emailController.text,
                        password: passwordController.text
                      );

                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          Snackbar(text: message),
                        );

                        if (isRegistered) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            "/login",
                            (route) => false,
                          );
                        }
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
                        "Daftar",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  const Text("Sudah punya akun?"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        "/login",
                        (route) => false
                      );
                    },
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Login",
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
