cdimport 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pratikum Mobile IF - D")
        ),
        body: Center(
          child: Column(
            children: [
              Text("Ini Ke-Satu"),
              Text("Ini Ke-Dua"),
              TextButton(
                  onPressed: (){},
                  child: Text("Text Button")
              ),
              OutlineButton(
                  onPressed: (){},
                  child: Text("Outline Button")
              ),
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Elevated Button")
              ),
              Image.asset('images/pic_satu.png'),
              Image.network("https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg")
            ],
          ),
        )
      ),
    );
  }
}
