import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/splash.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/home.dart';
import 'screens/diagnosa.dart';
import 'screens/diagnosa_hasil.dart';
import 'screens/riwayat.dart';
import 'screens/daftar.dart';
import 'screens/daftar_detail.dart';
import 'screens/bantuan.dart';
import 'screens/tentang.dart';

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
          primary: const Color(0xFFEAC696),
          secondary: const Color(0xFF967758),
          tertiary: const Color(0xFFEDE2CF),
          primaryContainer: const Color(0xFFFFFFFF),
          secondaryContainer: const Color(0xFFBA704F),
        ),
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(builder: ((context) => const Splash()));
          case "/login":
            return PageTransition(
              type: PageTransitionType.fade,
              child: const Login()
            );
          case "/register":
            return PageTransition(
              type: PageTransitionType.fade,
              child: const Register(),
            );
          case "/home":
            return PageTransition(
              type: PageTransitionType.fade,
              child: const Home(),
            );
          case "/diagnosa":
            return PageTransition(
              type: PageTransitionType.leftToRight,
              child: const Diagnosa(),
            );
          case "/diagnosa-hasil":
            return PageTransition(
              type: PageTransitionType.bottomToTop,
              child: const DiagnosaHasil(),
            );
          case "/riwayat":
            return PageTransition(
              type: PageTransitionType.bottomToTop,
              child: const Riwayat(),
            );
          case "/daftar":
            return PageTransition(
              type: PageTransitionType.rightToLeft,
              child: const Daftar(),
            );
          case "/daftar-detail":
            return PageTransition(
              type: PageTransitionType.leftToRight,
              child: const DaftarDetail(),
            );
          case "/bantuan":
            return PageTransition(
              type: PageTransitionType.leftToRight,
              child: const Bantuan(),
            );
          case "/tentang":
            return PageTransition(
              type: PageTransitionType.fade,
              child: const Tentang(),
            );
          default: return MaterialPageRoute(
            builder: ((context) => const Placeholder()),
          );
        }
      },
    );
  }
}
