import 'package:catcare_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../middleware/base_client.dart';
import '../models/symptom.dart';

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
  bool isVisible = true;

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

  void toggleCheckbox(int index) {
    if (listChecked.contains(index)) {
      listChecked.remove(index);
    }
    else {
      listChecked.add(index);
    }

    setState(() {});
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
                onTap: () => toggleCheckbox(index),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: Checkbox(
                      value: listChecked.contains(index),
                      onChanged: (_) => toggleCheckbox(index),
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
            onPressed: () {
              if (listChecked.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  Snackbar(text: "Pilih minimal 1 (satu) gejala")
                );

                return;
              }

              Navigator.of(context).pushNamed("/diagnosa-hasil");
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
