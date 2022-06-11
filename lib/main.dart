import 'package:flutter/material.dart';
import 'package:house_rent_app/pages/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "House Rent App",
      home: const LoginPage(),
    );
  }
}
