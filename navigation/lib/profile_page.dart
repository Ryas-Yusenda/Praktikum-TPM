import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String nama;
  final String username;
  final String email;
  final String nomor;
  final String alamat;

  const ProfilePage({
    Key? key,
    required this.nama,
    required this.username,
    required this.email,
    required this.nomor,
    this.alamat = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Profil"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Biodata",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              _logo(),
              const SizedBox(height: 32),
              Text(
                nama.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                username,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                email,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                nomor,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                alamat,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return const FlutterLogo(
      size: 50,
      style: FlutterLogoStyle.markOnly,
      curve: Curves.bounceInOut,
      duration: Duration(seconds: 5),
    );
  }
}
