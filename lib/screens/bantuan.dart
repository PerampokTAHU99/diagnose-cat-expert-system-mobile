import 'package:flutter/material.dart';

class Bantuan extends StatelessWidget {
  const Bantuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Bantuan"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Bantuan cara penggunaan aplikasi",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Menu Diagnosa",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Image(
                    image: AssetImage("img/diagnosa.png"),
                    width: 50,
                  ),
                  Text(
                    "Digunakan untuk melakukan diagnosa dengan cara menceklist gejala-gejala "
                    "yang ada pada kucing dan menekan tombol diagnosa untuk melihat hasil diagnosa.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Menu Riwayat",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Image(
                    image: AssetImage("img/cek.png"),
                    width: 50,
                  ),
                  Text(
                    "Pada menu ini bisa dilihat daftar riwayat diagnosa yang sudah pernah "
                    "dilakukan sebelumnya.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Daftar Penyakit",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Image(
                    image: AssetImage("img/daftar.png"),
                    width: 50,
                  ),
                  Text(
                    "Menu ini memberikan akses langsung ke daftar penyakit "
                    "yang ada pada database sistem. Pengguna dapat melihat "
                    "informasi rinci tentang berbagai penyakit yang dapat "
                    "memengaruhi kucing, termasuk gejala, penyebab, dan "
                    "langkah-langkah pengobatan yang mungkin diperlukan.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Bantuan",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Image(
                    image: AssetImage("img/bantuan.png"),
                    width: 50,
                  ),
                  Text(
                    "Menu ini menyediakan panduan atau petunjuk bagi pengguna "
                    "tentang cara menggunakan aplikasi dan informasi tambahan "
                    "tentang fitur-fitur aplikasi.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Tentang",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Image(
                    image: AssetImage("img/info.png"),
                    width: 50,
                  ),
                  Text(
                    "Menu ini berisi informasi tentang aplikasi itu sendiri, "
                    "seperti penjelasan tentang tujuan pembuatan aplikasi, "
                    "tim pengembang, dan informasi tambahan lainnya terkait aplikasi.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Keluar",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Image(
                    image: AssetImage("img/keluar.png"),
                    width: 50,
                  ),
                  Text(
                    "Menu ini memungkinkan pengguna untuk keluar dari aplikasi "
                    "sistem pakar diagnosa penyakit pada kucing. Saat dipilih, "
                    "pengguna akan keluar dari sistem dan kembali ke layar awal "
                    "atau menutup aplikasi.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
