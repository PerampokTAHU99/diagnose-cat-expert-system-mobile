import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../middleware/base_client.dart';
import '../models/diagnose.dart';
import '../models/symptom.dart';
import '../widgets/snackbar.dart';

class Diagnosa extends StatefulWidget {
  const Diagnosa({super.key});

  @override
  State<Diagnosa> createState() => _DiagnosaState();
}

class _DiagnosaState extends State<Diagnosa> {
  bool isLoading = true;
  List<Symptom> listSymptom = [];
  final List<int> listChecked = [];
  ScrollController scrollController = ScrollController();
  Diagnose? dataDiagnose = Diagnose();
  bool isVisible = true;
  String message = "";

  @override
  void initState() {
    fetchData();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isVisible) {
          isVisible = true;
        }
      }
      else {
        if (isVisible) {
          isVisible = false;
        }
      }

      setState(() {
        isVisible = !isVisible;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void fetchData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSymptomData().then((symptoms) {
        setState(() {
          listSymptom = symptoms;
          isLoading = false;
        });
      });
    });
  }

  Future<List<Symptom>> getSymptomData() async {
    Map<String, dynamic> jsonData = await BaseClient().get("/data/symptoms/");

    if (jsonData['status'] != 200) {
      return [];
    }

    return List.generate(
      jsonData['result'].length,
      (index) => Symptom.fromJson(jsonData['result'][index])
    );
  }

  void toggleCheckbox(int idSymptom) {
    if (listChecked.contains(idSymptom)) {
      listChecked.remove(idSymptom);
    }
    else {
      listChecked.add(idSymptom);
    }

    setState(() {});
  }

  Future<void> createDiagnose(List<int> symptoms) async {
    Map<String, dynamic> jsonData = await BaseClient().post(
      "/data/diagnoses/",
      body: {
        'symptoms': symptoms
      }
    );

    message = jsonData['message'];

    if (jsonData['status'] != 200) {
      dataDiagnose = null;

      return;
    }

    dataDiagnose = Diagnose.fromJson(jsonData['result']);

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text(
          "Pilih gejala pada kucing",
          style: TextStyle(fontSize: 16),
        ),
        elevation: 0,
      ),
      body: isLoading
      ? const Center(child: CircularProgressIndicator())
      : Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "img/doc_2.png",
              opacity: const AlwaysStoppedAnimation(0.5),
            ),
          ),
          ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.all(12.0),
            itemCount: listSymptom.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => toggleCheckbox(listSymptom[index].idSymptom!),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: Checkbox(
                      value: listChecked.contains(listSymptom[index].idSymptom!),
                      onChanged: (_) => toggleCheckbox(listSymptom[index].idSymptom!),
                    ),
                    title: Text(
                      listSymptom[index].descOfSymptom.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        child: Visibility(
          visible: isVisible,
          child: ElevatedButton(
            onPressed: () async {
              if (listChecked.length < 4) {
                ScaffoldMessenger.of(context).showSnackBar(
                  Snackbar(text: "Pilih minimal 4 (empat) gejala")
                );

                return;
              }

              if (listChecked.length > 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  Snackbar(text: "Pilih maksimal 10 (sepuluh) gejala")
                );

                return;
              }

             await createDiagnose(listChecked);

              if (mounted) {
                Navigator.of(context).pushNamed(
                  "/diagnosa-hasil",
                  arguments: dataDiagnose,
                );

                return;
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text('Diagnosa'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
