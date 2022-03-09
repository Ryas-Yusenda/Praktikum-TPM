import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();

  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.center;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _logo(),
            _usernameField(),
            _passwordField(),
            _loginButton(context),
            register()
        ]),
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

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide:
                BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide:
                BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.blue : Colors.red, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          String text = "";
          if (_controller.text == "ryas" && password == "123") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }
          // ignore: avoid_print
          print("isLoginSuccess : $isLoginSuccess");
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }

  Widget register() {
    return TextButton(
      child: const Text("Register",
      style: TextStyle(fontSize: 16, color: Colors.black54)),
      onPressed: () {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
      return HomePage(username: _controller.text);
    }));
      }, // Respon ketika button ditekan
    );
  }
}
