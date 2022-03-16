import 'package:flutter/material.dart';
import 'register_page.dart';
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();

  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.center;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff8faf8),
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _logo(),
            const SizedBox(height: 40),
            _emailField(),
            _passwordField(),
            _loginButton(context),
            register()
          ]),
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

  Widget _emailField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        controller: _email,
        decoration: InputDecoration(
          hintText: 'Email',
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
          isLoginSuccess = true;
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
          primary: Colors.blue, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          String text = "";
          if (_email.text == "rysptr08@gmail.com" && password == "123") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
              // ignore: todo
              // TODO: Navigator Push Replacement
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProfilePage(
                  nama: "Ryas Putra Yusenda Dalimunthe",
                  email: "rysptr08@gmail.com",
                  nomor: "085276781130",
                  bio: "https://ryas-yusenda.github.io/",
                );
              }));
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
      // ignore: todo
      // TODO: Navigator Push Replacement
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const RegisterPage();
        }));
      }, // Respon ketika button ditekan
    );
  }
}
