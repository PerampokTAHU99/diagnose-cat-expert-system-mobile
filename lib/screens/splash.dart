import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    const Duration duration = Duration(seconds: 2);

    return Timer(duration, () {
      Navigator.of(context).pushReplacementNamed("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAC696),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100.0),
                const Text(
                  "Aplikasi Sistem Pakar",
                  style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20
                  ),
                ),
                
                const SizedBox(height: 100.0),
                Image.asset('img/splash_screen.png'),

                const SizedBox(height: 100.0),
                const Text(
                  "Diagnosa penyakit pada kucing",
                  style: TextStyle(
                    fontSize: 14.0
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}