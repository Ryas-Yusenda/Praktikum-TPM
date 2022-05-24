import 'package:flutter/material.dart';
import 'package:shared_pref_dan_hive/onbording_screnn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/keranjang.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class HiveBoxes {
  static Box<Item> getItems() => Hive.box<Item>('items');
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belanja'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHomePage', false);

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const OnBordingScreen()));
            },
          )
        ],
      ),
      body: ValueListenableBuilder<Box<Item>>(
        valueListenable: HiveBoxes.getItems().listenable(),
        builder: (context, box, _) {
          final items = box.values.toList().cast<Item>();
          if (items.isEmpty) {
            return const Center(
              child: Text('Keranjang Kosong'),
            );
          } else {
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (BuildContext context, int index) {
                Item? res = box.getAt(index);
                if (res!.description == 'Rp3.000') {
                  
                }
                return Dismissible(
                  background: Container(
                    color: Colors.red,
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    res.delete();
                  },
                  child: ListTile(
                    title: Text(res.title),
                    subtitle: Text(res.description),
                  ),
                );
              },
            );
            
          }
        },
      ),
      bottomSheet: Container(
        height: 60.0,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3B1D2429),
              offset: Offset(0, -3),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: GestureDetector(
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddItem()))
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Menu',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
