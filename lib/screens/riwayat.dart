import 'package:flutter/material.dart';

import 'diagnosa_hasil.dart';

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
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DiagnosaHasil()));
            },
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Hasil Diagnosa", style: TextStyle(fontWeight: FontWeight.w700)),
                            Text("Nama Penyakit: Scabies"),
                            Text("Tanggal: 21 April 2022"),
                          ],
                        ),
                  
                        Image.asset('img/cover.png', width: 100.0,)
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
    );
  }
}