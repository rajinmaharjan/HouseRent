import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_rent_app/models/user_model.dart';

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
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "Name: ${loggedInUser.firstName} ${loggedInUser.lastName}\nE-mail: ${loggedInUser.email}\nPhone number: ${loggedInUser.phoneNumber}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              )
            ],
          ),
          // Profile image
          Positioned(
            top: 40,
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: new AssetImage("assets/images/houseLogo.png"),
                ),
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
    // return Center(
    //     child: Padding(
    //   padding: EdgeInsets.all(20),
    //   child: Column(
    //     children: <Widget>[
    //       SizedBox(
    //         child: CircleAvatar(
    //           backgroundColor: Colors.amber,
    //           child: FlutterLogo(),
    //           radius: 50,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Text(
    //         " Name: ${loggedInUser.firstName} ${loggedInUser.lastName}",
    //         textAlign: TextAlign.left,
    //         style: TextStyle(
    //             fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    //       ),
    //       SizedBox(
    //         height: 8,
    //       ),
    //       Text(
    //         " E-mail: ${loggedInUser.email}",
    //         style: TextStyle(
    //             fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    //       ),
    //       SizedBox(
    //         height: 8,
    //       ),
    //       Text(
    //         " Phone number: ${loggedInUser.phoneNumber}",
    //         style: TextStyle(
    //             fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    //       ),
    //     ],
    //   ),
    // ));
  }
}
