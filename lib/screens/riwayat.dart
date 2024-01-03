import 'package:flutter/material.dart';

import '../middleware/base_client.dart';
import '../models/diagnose.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  bool isLoading = true;
  List<Diagnose> listDiagnose = [];

  @override
  void initState() {
    fetchData();

    super.initState();
  }

  void fetchData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDiagnoseData().then((histories) {
        setState(() {
          listDiagnose = histories;
          isLoading = false;
        });
      });
    });
  }

  Future<List<Diagnose>> getDiagnoseData() async {
    Map<String, dynamic> jsonData = await BaseClient().get("/data/diagnoses/");

    if (jsonData['status'] != 200) {
      return [];
    }

    return List.generate(
      jsonData['result'].length,
      (index) => Diagnose.fromJson(jsonData['result'][index]['disease'])
    );
  }

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
          isLoading
          ? const Center(
            child: CircularProgressIndicator(),
          )
          : ListView.builder(
            itemCount: listDiagnose.length,
            padding: const EdgeInsets.all(12.0),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  "/diagnosa-hasil",
                  arguments: listDiagnose[index]
                );
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${listDiagnose[index].latinNameOfDisease}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Nama Penyakit: ",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${listDiagnose[index].nameOfDisease}",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Tanggal:",
                                      style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${listDiagnose[index].date}",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "${BaseClient.imageUrl}/${listDiagnose[index].picture}",
                              fit: BoxFit.cover,
                              width: 100,
                              height: 75,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
