import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
  const Tentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAC696),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Tentang"),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 400,
                child: Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              Image.asset(
                                "img/theo.png",
                                width: 200,
                              ),
                              const Text(
                                "Theo Fahrizal Syam",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                "Aplikasi Sistem Pakar Diagnosa Penyakit pada kucing ini dibuat "
                                "sebagai salah satu syarat untuk menyelesaikan studi jenjang Strata 1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              Divider(
                                thickness: 3,
                                indent: 25,
                                endIndent: 25,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              const Text(
                                "Universitas Teknologi Yogyakarta",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
