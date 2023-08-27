import 'package:flutter/material.dart';

class DaftarDetail extends StatefulWidget {
  const DaftarDetail({super.key});

  @override
  State<DaftarDetail> createState() => _DaftarDetailState();
}

class _DaftarDetailState extends State<DaftarDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Detail penyakit"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('img/cover.png'),

            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text("Scabies atau kudis merupakan penyakit kulit menular yang bisa dialami oleh manusia serta hewan, termasuk hewan berbulu seperti kucing. Sedangkan scabies kucing merupakan kudis pada kucing yang disebabkan oleh parasit yang disebut dengan Notoedres cati dan Sarcoptes scabiei. Sarcoptes scabiei merupakan parasit dari keluarga Sarcoptidae. Parasit jenis ini akan masuk ke dalam kulit kucing dan kemudian menjadi scabies. Induk Sarcoptes scabiei biasanya akan bertelur di bawah kulit menyebabkan kucing menjadi gatal, hingga akhirnya muncul scabies kucing di area telinga.", textAlign: TextAlign.justify),
            )
          ],
        ),
      ),
    );
  }
}