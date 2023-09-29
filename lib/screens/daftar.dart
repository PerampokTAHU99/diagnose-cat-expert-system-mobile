import 'package:flutter/material.dart';

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  final List<String> _listData = ['Distemper', 'Distemper', 'Distemper', 'Distemper'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Daftar penyakit"),
        elevation: 0,
      ),
      body: Stack(
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
            itemCount: _listData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_listData[index]),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).pushNamed("/daftar-detail");
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
