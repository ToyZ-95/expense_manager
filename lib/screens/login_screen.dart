import 'package:expense_manager/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                  unselectedLabelColor: Color(0xFF9ba5f8),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const TextField(
                          style: TextStyle(
                            color: Color(0xFF1441F1),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(
                              color: Color(0xFF9ba5f8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        const TextField(
                          style: TextStyle(
                            color: Color(0xFF1441F1),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Color(0xFF9ba5f8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Color(0xFF9ba5f8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 600,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            primary: const Color(0xFF1441F1),
                          ),
                          child: Container(
                            // decoration: const BoxDecoration(
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(100.0),
                            //   ),
                            // ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            child: const Text('Log In'),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const [Text('Register Page')],
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
