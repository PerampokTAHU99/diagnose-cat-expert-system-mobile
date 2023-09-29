import 'package:flutter/material.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Riwayat"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "img/doc_1.png",
              opacity: const AlwaysStoppedAnimation(0.5),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(12.0),
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/diagnosa-hasil");
                },
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 170,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hasil Diagnosa", style: TextStyle(fontWeight: FontWeight.w700),),
                                  Text("Nama Penyakit: Scabies",),
                                  Text("Tanggal: 21 April 2022",),
                                ],
                              ),
                            ),
                            Image.asset('img/cover.png', scale: 5,),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
