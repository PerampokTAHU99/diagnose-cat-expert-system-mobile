import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _showExitDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Keluar Aplikasi"),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "Apakah anda ingin keluar dari aplikasi?",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "Tidak",
                style: TextStyle(color: Theme.of(context).colorScheme.secondary,),
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text("Keluar", style: TextStyle(color: Colors.redAccent),),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                "/login",
                (route) => false,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAC696),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Container(
                  color: const Color(0xff967758),
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('img/cat.png'),
                      const Column(
                        children: [
                          Text(
                            "Selamat Datang",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            "di CatCare App",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              const Text(
                "MENU",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: Color(0xff967758),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/diagnosa");
                    },
                    child: Column(
                      children: [
                        Image.asset('img/diagnosa.png'),
                        const SizedBox(height: 5.0),
                        const Text("Diagnosa"),
                      ],
                    )
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/riwayat");
                    },
                    child: Column(
                      children: [
                        Image.asset('img/cek.png'),
                        const SizedBox(height: 5.0),
                        const Text("Riwayat"),
                        const Text("Diagnosa"),
                      ],
                    )
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/daftar");
                    },
                    child: Column(
                      children: [
                        Image.asset('img/daftar.png'),
                        const SizedBox(height: 5.0),
                        const Text("Daftar"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/bantuan");
                    },
                    child: Column(
                      children: [
                        Image.asset('img/bantuan.png'),
                        const SizedBox(height: 5.0),
                        const Text("Bantuan"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/tentang");
                    },
                    child: Column(
                      children: [
                        Image.asset('img/info.png'),
                        const SizedBox(height: 5.0),
                        const Text("Tentang"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showExitDialog(context);
                    },
                    child: Column(
                      children: [
                        Image.asset('img/keluar.png'),
                        const SizedBox(height: 5.0),
                        const Text("Keluar"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
