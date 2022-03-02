import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Screen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Login Screen"),
          ),
          resizeToAvoidBottomInset: false,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _logo(),
                _username(),
                _password(),
                _loginButton(context),
                _resetPass(),
              ]),
        ));
  }

  Widget _logo() {
    return const FlutterLogo(
      size: 50,
      style: FlutterLogoStyle.markOnly,
      curve: Curves.bounceInOut,
      duration: Duration(seconds: 5),
    );
  }

  Widget _username() {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
      child: TextFormField(
        enabled: true,
        decoration: const InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.all(20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.all(20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      width: 1000,
      child: ElevatedButton(
        child: const Text("Log In"),
        onPressed: () {}, // Respon ketika button ditekan
      ),
    );
  }

  Widget _resetPass() {
    return Container(
        child: TextButton(
          child: const Text("Forgot Password ?",
          style: TextStyle(fontSize: 16, color: Colors.black54)),
      onPressed: () {}, // Respon ketika button ditekan
    ));
  }
}
