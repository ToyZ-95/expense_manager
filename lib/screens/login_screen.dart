import 'package:expense_manager/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kAppBackgroundThemeBox,
      child: SingleChildScrollView(
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: TabBar(
            padding: const EdgeInsets.only(top: 90.0),
            tabs: [
              Container(
                decoration: const BoxDecoration(),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Log in',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
