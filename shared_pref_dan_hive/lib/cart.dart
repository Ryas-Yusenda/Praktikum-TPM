import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/keranjang.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validated() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _onFormSubmit();
    } else {
      SnackBar snackBar =
          const SnackBar(content: Text("Gagal Ditambah ke Keranjang"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  late List<List<String>> items = [];
  late String title;
  late String description;
  bool? _isFirstItemSelected = false;
  bool? _isSecondItemSelected = false;
  bool? _isThirdItemSelected = false;
  String titleItem1 = "Penghapus";
  String titleItem2 = "Pensil";
  String titleItem3 = "Buku";
  String price1 = "Rp3.000";
  String price2 = "Rp4.0000";
  String price3 = "Rp8.000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CheckboxListTile(
                  title: Text(titleItem1),
                  subtitle: Text(price1),
                  value: _isFirstItemSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      _isFirstItemSelected = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(titleItem2),
                  subtitle: Text(price2),
                  value: _isSecondItemSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      _isSecondItemSelected = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(titleItem3),
                  subtitle: Text(price3),
                  value: _isThirdItemSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      _isThirdItemSelected = value;
                    });
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          validated();
                        },
                        child: const Text('Tambah ke Keranjang'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onFormSubmit() {
    Box<Item> todobox = Hive.box<Item>('items');
    if (_isFirstItemSelected == true) {
      items.add([titleItem1, price1]);
      _isFirstItemSelected = false;
    }
    if (_isSecondItemSelected == true) {
      items.add([titleItem2, price2]);
      _isSecondItemSelected = false;
    }
    if (_isThirdItemSelected == true) {
      items.add([titleItem3, price3]);
      _isThirdItemSelected = false;
    }
    for (var item in items) {
      todobox.add(Item(title: item[0], description: item[1]));
    }
    SnackBar snackBar =
        const SnackBar(content: Text("Ditambahkan ke Keranjang"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
