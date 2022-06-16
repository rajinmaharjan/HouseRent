import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_rent_app/models/user_model.dart';
import 'package:house_rent_app/reuseable_widgets/reuseable_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final _firstNameTextController = new TextEditingController();
    final _lastNameTextController = new TextEditingController();
    final _userNameTextController = new TextEditingController();
    final _emailTextController = new TextEditingController();
    final _numberTextController = new TextEditingController();

    final firstNameField = TextFormField(
      readOnly: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelText: "${loggedInUser.firstName}",
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    final lastNameField = TextFormField(
      readOnly: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelText: "${loggedInUser.lastName}",
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    final userNameField = TextFormField(
      readOnly: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelText: "${loggedInUser.userName}",
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    final emailField = TextFormField(
      readOnly: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.black,
        ),
        labelText: "${loggedInUser.email}",
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    final numberField = TextFormField(
      readOnly: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.call,
          color: Colors.black,
        ),
        labelText: "${loggedInUser.phoneNumber}",
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              profile("assets/images/houseLogo.png"),
              SizedBox(
                height: 10,
              ),
              firstNameField,
              SizedBox(
                height: 10,
              ),
              lastNameField,
              SizedBox(
                height: 10,
              ),
              userNameField,
              SizedBox(
                height: 10,
              ),
              emailField,
              SizedBox(
                height: 10,
              ),
              numberField,
            ],
          ),
        ),
      ),
      // body: Stack(
      //   alignment: Alignment.center,
      //   children: <Widget>[
      //     Column(
      //       children: <Widget>[
      //         Expanded(
      //           child: Container(
      //             color: Colors.white,
      //             child: Center(
      //               child: Text(
      //                 "Name: ${loggedInUser.firstName} ${loggedInUser.lastName}\nE-mail: ${loggedInUser.email}\nPhone number: ${loggedInUser.phoneNumber}",
      //                 textAlign: TextAlign.left,
      //                 style: TextStyle(
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.black),
      //               ),
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //     Positioned(
      //       top: 40,
      //       child: Container(
      //         height: 150.0,
      //         width: 150.0,
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           image: DecorationImage(
      //             image: new AssetImage("assets/images/houseLogo.png"),
      //           ),
      //           color: Colors.green,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
