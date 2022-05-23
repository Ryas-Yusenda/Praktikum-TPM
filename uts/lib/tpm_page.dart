import 'package:flutter/material.dart';

class TPMPage extends StatelessWidget {
  final String judul;
  final String isi;

  const TPMPage({
    Key? key,
    required this.judul,
    required this.isi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff8faf8),
        elevation: 1,
        title: const Text('Edit Profile'),
        leading: GestureDetector(
          child: const Icon(Icons.close, color: Colors.black),
          // ignore: todo
          // TODO: Navigator Push Replacement
          onTap: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.done, color: Colors.blue),
            ),
            onTap: () {
              SnackBar snackBar = const SnackBar(
                content: Text(
                  "* Fitur Belum Ada",
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: TextEditingController()..text = judul,
                  onChanged: ((value) {}),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: TextEditingController()..text = isi,
                  maxLines: 13,
                  onChanged: ((value) {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
