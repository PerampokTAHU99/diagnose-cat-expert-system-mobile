import 'package:flutter/material.dart';

import 'home.dart';

class DiagnosaHasil extends StatefulWidget {
  const DiagnosaHasil({super.key});

  @override
  State<DiagnosaHasil> createState() => _DiagnosaHasilState();
}

class _DiagnosaHasilState extends State<DiagnosaHasil> {
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
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        Text("Nama penyakit", style: TextStyle(fontWeight: FontWeight.w700), textAlign: TextAlign.center),
                        SizedBox(height: 10.0),
                        Text("Scabies kucing merupakan kudis pada kucing yang disebabkan oleh parasit yang disebut dengan Notoedres cati dan Sarcoptes scabiei. See more"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8.0),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        Text("Pencegahan", style: TextStyle(fontWeight: FontWeight.w700), textAlign: TextAlign.center),
                        SizedBox(height: 10.0),
                        Text("Untuk mengobati kucing sakit yang terkena scabies, dokter dapat meresepkan obat antiparasit, misalnya ivermectin, baik yang diminum, dioles, atau disuntikkan. Pillhan obat ini akan disesuaikan dengan jenis tungau, area tubuh yang terkena, dan tingkat keparahan scabies pada kucing."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8.0),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        Text("Solusi", style: TextStyle(fontWeight: FontWeight.w700), textAlign: TextAlign.center),
                        SizedBox(height: 10.0),
                        Text("PERIKSAKAN KE DOKTER HEWAN TERDEKAT UNTUK KETERANGAN DAN PEMERIKSAAN LEBIH LANJUT"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Home()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text('Back to home'),
          )
        ],
      ),
    );
  }
}