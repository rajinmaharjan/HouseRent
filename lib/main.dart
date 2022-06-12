import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:house_rent_app/layout/house_description.dart';
import 'package:house_rent_app/pages/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "House Rent App",
      home: const LoginPage(),
      routes: {'./house-description': (ctx) => HouseDescription()},
    );
  }
}
