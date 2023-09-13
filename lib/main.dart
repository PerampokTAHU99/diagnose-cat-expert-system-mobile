import 'package:cat/screens/diagnosa_hasil.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/daftar.dart';
import 'screens/diagnosa.dart';
import 'screens/home.dart';
import 'screens/riwayat.dart';
import 'screens/splash.dart';

void main() => runApp(const MyApp());

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
          secondary: const Color(0xff967758),
        ),
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(builder: ((context) => const Splash()));
          case "/home":
            return PageTransition(
              child: const Home(),
              type: PageTransitionType.fade,
            );
          case "/diagnosa":
            return PageTransition(
              child: const Diagnosa(),
              type: PageTransitionType.leftToRightWithFade,
            );
          case "/diagnosa-hasil":
            return PageTransition(
              child: const DiagnosaHasil(),
              type: PageTransitionType.bottomToTop,
            );
          case "/riwayat":
            return PageTransition(
              child: const Riwayat(),
              type: PageTransitionType.bottomToTop,
            );
          case "/daftar":
            return PageTransition(
              child: const Daftar(),
              type: PageTransitionType.rightToLeftWithFade,
            );
          default: return MaterialPageRoute(
            builder: ((context) => const Placeholder()),
          );
        }
      },
    );
  }
}
