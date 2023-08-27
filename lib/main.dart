import 'package:cat/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatCare App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xffEAC696),
          secondary: const Color(0xff967758)
        ),
      ),
      home: const Splash(),
    );
  }
}