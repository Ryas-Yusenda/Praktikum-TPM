import 'package:flutter/material.dart';
import 'package:shared_pref_dan_hive/home.dart';
import 'package:shared_pref_dan_hive/onbording_screnn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/keranjang.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHomePage = prefs.getBool('showHomePage') ?? false;

  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  await Hive.openBox<Item>('items');

  runApp(MyApp(showHomePage: showHomePage));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.showHomePage}) : super(key: key);

  final bool showHomePage;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Info',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: showHomePage ? const HomePage() : const OnBordingScreen(),
    );
  }
}
