import 'package:flutter/material.dart';

import '../middleware/base_client.dart';

class DaftarDetail extends StatelessWidget {
  final Map<String, dynamic> diseaseData;

  const DaftarDetail({super.key, required this.diseaseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(diseaseData['nameOfDisease']),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network("${BaseClient.apiUrl}/${diseaseData['picture']}"),

            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                diseaseData['description'],
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
