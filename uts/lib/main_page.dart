import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'tpm_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.center;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff8faf8),
        title: const Text(
          "123190011",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            _personalButton(context),
            const SizedBox(height: 40),
            _tpmButton(context),
          ]),
    );
  }

  Widget _personalButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ProfilePage(
              // nim, nama, kelas, tanggal lahir, tempat tinggal, hobi
              nim: "123190011",
              nama: "Ryas Putra Yusenda Dalimunthe",
              kelas: "Teknologi Dan Pemrograman Mobile IF-B",
              tanggalLahir: "5 February 2001",
              alamat: "Jalan jendral sudirman ",
              hobi: "Ngekoding",
            );
          }));
        },
        child: const Text('Profile Mahasiswa'),
      ),
    );
  }

  Widget _tpmButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const TPMPage(
              judul: "Flutter",
              isi:
                  "Flutter adalah sebuah framework aplikasi mobil sumber terbuka yang diciptakan oleh Google. Flutter digunakan dalam pengembangan aplikasi untuk sistem operasi Android, iOS, Windows, Linux, MacOS, serta menjadi metode utama untuk membuat aplikasi Google Fuchsia.",
            );
          }));
        },
        child: const Text('Teknologi Mobile'),
      ),
    );
  }
}
