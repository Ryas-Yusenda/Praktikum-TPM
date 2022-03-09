import 'package:flutter/material.dart';
import 'login_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _namaLengkap = "";
  String _email = "";
  String _nomorHandphone = "";
  String _alamatRumah = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Register",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                // "Hai, ${widget.username}\nSelamat Datang",
                "Selamat Datang",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 24),
              const Text("Lengkapi Biodata"),
              const SizedBox(height: 12),
              _buildForm(),
              const SizedBox(height: 24),
              _buildButtonSubmit(),
              login(),
            ]),
      ),
    );
  }

  Widget _formInput(
      {required String hint,
      required String label,
      required Function(String value) setStateInput,
      int maxLines = 1}) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        const SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Nama Lengkap",
          label: "Nama *",
          setStateInput: (value) {
            setState(() {
              _namaLengkap = value;
            });
          },
        ),
        const SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Alamat Email",
          label: "Email *",
          setStateInput: (value) {
            setState(() {
              _email = value;
            });
          },
        ),
        const SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Nomor HP Aktif",
          label: "Nomor HP *",
          setStateInput: (value) {
            setState(() {
              _nomorHandphone = value;
            });
          },
        ),
        const SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Alamat Rumah",
          label: "Alamat",
          setStateInput: (value) {
            setState(() {
              _alamatRumah = value;
            });
          },
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildButtonSubmit() {
    return ElevatedButton(
      onPressed: () {
        if (_namaLengkap == "" || _email == "" || _nomorHandphone == "") {
          SnackBar snackBar = const SnackBar(
            content: Text("* data tidak boleh kosong"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProfilePage(
              nama: _namaLengkap,
              username: widget.username,
              email: _email,
              nomor: _nomorHandphone,
              alamat: _alamatRumah,
            );
          }));
        }
      },
      child: const Text('Submit'),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          textStyle: const TextStyle(fontSize: 16)),
    );
  }

  Widget login() {
    return TextButton(
      child: const Text("Register",
          style: TextStyle(fontSize: 16, color: Colors.black54)),
      onPressed: () {}, // Respon ketika button ditekan
    );
  }
}
