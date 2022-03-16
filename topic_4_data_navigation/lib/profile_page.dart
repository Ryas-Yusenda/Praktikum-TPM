import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String nama;
  final String email;
  final String nomor;
  final String bio;

  const ProfilePage({
    Key? key,
    required this.nama,
    required this.email,
    required this.nomor,
    this.bio = "",
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
              CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/pic.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              TextButton(
                child: const Text("Change Profile",
                    style: TextStyle(fontSize: 16, color: Colors.blue)),
                onPressed: () {
                  SnackBar snackBar = const SnackBar(
                    content: Text("* Fitur Belum Ada"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }, // Respon ketika button ditekan
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    labelText: 'Name',
                  ),
                  controller: TextEditingController()..text = nama,
                  onChanged: ((value) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Email address',
                    labelText: 'Email address',
                  ),
                  controller: TextEditingController()..text = email,
                  onChanged: ((value) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Number',
                    labelText: 'Number',
                  ),
                  controller: TextEditingController()..text = nomor,
                  onChanged: ((value) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Address',
                    labelText: 'Address',
                  ),
                  controller: TextEditingController()..text = bio,
                  maxLines: 3,
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
