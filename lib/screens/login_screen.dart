import 'package:expense_manager/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: const EdgeInsets.only(left: 24),
      decoration: kAppBackgroundThemeBox,
      child: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 110),
                child: const TabBar(
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Color(0xFF949FF8),
                  labelColor: Color(0xFF1441F1),
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                  padding: EdgeInsets.only(top: 90.0),
                  labelPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Log In',
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Register',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //Add this to give height

                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(top: 90),
                child: TabBarView(
                  children: [
                    Column(
                      children: const [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [Text('Register Page')],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
