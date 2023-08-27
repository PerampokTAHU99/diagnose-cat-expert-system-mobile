import 'package:flutter/material.dart';

import 'diagnosa_hasil.dart';

class Diagnosa extends StatefulWidget {
  const Diagnosa({super.key});

  @override
  State<Diagnosa> createState() => _DiagnosaState();
}

class _DiagnosaState extends State<Diagnosa> {
  final List<bool> _isCheckedList = [false, false, false];
  final List<String> _checkBoxTitles = ['Option 1', 'Option 2', 'Option 3'];

  void _toggleCheckbox(int index, bool value) {
    setState(() {
      _isCheckedList[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Pilih gejala pada kucing"),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: _checkBoxTitles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _toggleCheckbox(index, (!_isCheckedList[index])),
            child: Card(
              elevation: 0,
              child: ListTile(
                leading: Checkbox(
                  value: _isCheckedList[index],
                  onChanged: (value) => _toggleCheckbox(index, value!),
                ),
                title: Text(_checkBoxTitles[index]),
              ),
            ),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DiagnosaHasil()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        child: const Text('Diagnosa'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}