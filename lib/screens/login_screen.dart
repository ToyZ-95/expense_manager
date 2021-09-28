import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/services/firebase_auth.dart';
import 'package:expense_manager/widgets/custom_elevated_button.dart';
import 'package:expense_manager/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController signInEmailTextFieldController =
      TextEditingController();
  TextEditingController signInPasswordTextFieldController =
      TextEditingController();

  TextEditingController registerEmailTextFieldController =
      TextEditingController();
  TextEditingController registerPasswordTextFieldController =
      TextEditingController();
  TextEditingController registerConfirmPasswordTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        decoration: kAppBackgroundThemeBox,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 110),
                child: const TabBar(
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: kSecondaryColor,
                  labelColor: kPrimaryColor,
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
                height: MediaQuery.of(context).size.height - 90.0,
                padding: const EdgeInsets.only(top: 90),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextField(
                          label: 'E-mail',
                          textFieldontroller: signInEmailTextFieldController,
                          obsecure: false,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        CustomTextField(
                          label: 'Password',
                          textFieldontroller: signInPasswordTextFieldController,
                          obsecure: true,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        CustomElevatedButton(
                            title: 'Log In',
                            onPressed: () {
                              signIn(signInEmailTextFieldController.text,
                                  signInPasswordTextFieldController.text);
                            }),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextField(
                          label: 'E-mail',
                          textFieldontroller: registerEmailTextFieldController,
                          obsecure: false,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        CustomTextField(
                          label: 'Set Password',
                          textFieldontroller:
                              registerPasswordTextFieldController,
                          obsecure: true,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        CustomTextField(
                          label: 'Confirm Password',
                          textFieldontroller:
                              registerConfirmPasswordTextFieldController,
                          obsecure: true,
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        CustomElevatedButton(
                          title: 'Register',
                          onPressed: () {},
                        ),
                      ],
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
