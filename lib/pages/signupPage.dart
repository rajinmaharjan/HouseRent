import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:house_rent_app/pages/homePage.dart';
import 'package:house_rent_app/pages/loginPage.dart';
import 'package:house_rent_app/reuseable_widgets/reuseable_widgets.dart';
import 'package:house_rent_app/utils/colors_utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _firstNameTextController = TextEditingController();
  TextEditingController _lastNameTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _numberTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringColor("5ECC54"),
              hexStringColor("954c64"),
              hexStringColor("5ECCFF")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.fromLTRB(20, 90, 20, 0),
              child: Column(
                children: <Widget>[
                  reuseableTextField("Enter first name", Icons.person_outline,
                      false, _firstNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reuseableTextField("Enter Last name", Icons.person_outline,
                      false, _lastNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reuseableTextField("Enter username", Icons.person_outline,
                      false, _userNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reuseableTextField("Enter email address", Icons.email, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reuseableTextField("Enter phone number", Icons.phone, false,
                      _numberTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reuseableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  SizedBox(
                    height: 20,
                  ),
                  loginSignUpButton(context, false, () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("Created new account");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                ],
              ),
            ))));
  }
}
