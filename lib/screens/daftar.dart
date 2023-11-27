import 'package:flutter/material.dart';

import '../middleware/base_client.dart';
import '../models/disease.dart';

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  bool isLoading = true;
  List<Disease> listDisease = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDiseaseData().then((diseases) {
        setState(() {
          listDisease = diseases;
          isLoading = false;
        });
      });
    });
  }

  Future<List<Disease>> getDiseaseData() async {
    Map<String, dynamic> jsonData = await BaseClient().get("/data/diseases/");

    if (jsonData['status'] != 200) {
      return [];
    }

    return List.generate(
      jsonData['result'].length,
      (index) => Disease.fromJson(jsonData['result'][index])
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Daftar penyakit"),
        elevation: 0,
      ),
      body: isLoading
      ? const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      )
      : Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "img/doc_3.png",
              opacity: const AlwaysStoppedAnimation(0.5),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.black45,
            ),
            padding: const EdgeInsets.all(12.0),
            itemCount: listDisease.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listDisease[index].nameOfDisease.toString()),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Disease disease = listDisease[index];

                  Navigator.of(context).pushNamed(
                    "/daftar-detail",
                    arguments: {
                      'idDisease': disease.idDisease,
                      'codeOfDisease': disease.codeOfDisease,
                      'nameOfDisease': disease.nameOfDisease,
                      'latinNameOfDisease': disease.latinNameOfDisease,
                      'picture': disease.picture,
                      'description': disease.description,
                      'precaution': disease.precaution,
                      'solution': disease.solution
                    }
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
