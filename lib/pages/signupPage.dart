import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_rent_app/models/user_model.dart';
import 'package:house_rent_app/pages/loginPage.dart';
import 'package:house_rent_app/reuseable_widgets/reuseable_widgets.dart';
import 'package:house_rent_app/utils/colors_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final _firstNameTextController = new TextEditingController();
  final _lastNameTextController = new TextEditingController();
  final _userNameTextController = new TextEditingController();
  final _numberTextController = new TextEditingController();
  final _emailTextController = new TextEditingController();
  final _passwordTextController = new TextEditingController();
  final _confirmPasswordTextController = new TextEditingController();
  RegExp regex = new RegExp(r'^.{3,}$');
  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: _firstNameTextController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your First Name");
        }

        if (!regex.hasMatch(value)) {
          return ("Please Enter valid First Name");
        }

        return null;
      },
      onSaved: (value) {
        _firstNameTextController.text = value!;
      },
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black.withOpacity(0.9)),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelText: "First Name",
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.black.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );

    final lastNameField = TextFormField(
      autofocus: false,
      controller: _lastNameTextController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your Last Name");
        }

        if (!regex.hasMatch(value)) {
          return ("Please Enter valid Last Name");
        }

        return null;
      },
      onSaved: (value) {
        _lastNameTextController.text = value!;
      },
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black.withOpacity(0.9)),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelText: "Last Name",
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.black.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );

    final userNameField = TextFormField(
      autofocus: false,
      controller: _userNameTextController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter username");
        }

        if (!regex.hasMatch(value)) {
          return ("Username must be of length greater than 3");
        }

        return null;
      },
      onSaved: (value) {
        _userNameTextController.text = value!;
      },
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black.withOpacity(0.9)),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelText: "Username",
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.black.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: _emailTextController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your Email address");
        }

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9._]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email address");
        }

        return null;
      },
      onSaved: (value) {
        _emailTextController.text = value!;
      },
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black.withOpacity(0.9)),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.black,
        ),
        labelText: "Email address",
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.black.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );

    final numberField = TextFormField(
      autofocus: false,
      controller: _numberTextController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your phone number");
        }

        if (value.length != 10) {
          return ("Please Enter a valid phone number");
        }

        return null;
      },
      onSaved: (value) {
        _numberTextController.text = value!;
      },
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black.withOpacity(0.9)),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.call,
          color: Colors.black,
        ),
        labelText: "Phone number",
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.black.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: _passwordTextController,
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your password");
        }

        if (!RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
            .hasMatch(value)) {
          return ("*should contain at least one upper case \n*should contain at least one lower case \n*should contain at least one digit\n*should contain at least one Special character \n*Must be at least 6 characters in length ");
        }

        return null;
      },
      onSaved: (value) {
        _passwordTextController.text = value!;
      },
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black.withOpacity(0.9)),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.key,
          color: Colors.black,
        ),
        labelText: "Enter your password",
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.black.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: _confirmPasswordTextController,
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        if (_confirmPasswordTextController.text !=
            _passwordTextController.text) {
          return ("Passwword do not match");
        }
        return null;
      },
      onSaved: (value) {
        _confirmPasswordTextController.text = value!;
      },
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black.withOpacity(0.9)),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.key,
          color: Colors.black,
        ),
        labelText: "Re-enter your password",
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.black.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 206, 47),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringColor("00FF00"),
            hexStringColor("F0FF0F"),
            hexStringColor("FF0000"),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  firstNameField,
                  const SizedBox(
                    height: 10,
                  ),
                  lastNameField,
                  const SizedBox(
                    height: 10,
                  ),
                  userNameField,
                  const SizedBox(
                    height: 10,
                  ),
                  emailField,
                  const SizedBox(
                    height: 10,
                  ),
                  numberField,
                  const SizedBox(
                    height: 10,
                  ),
                  passwordField,
                  SizedBox(
                    height: 10,
                  ),
                  confirmPasswordField,
                  SizedBox(
                    height: 10,
                  ),
                  loginSignUpButton(context, false, () {
                    signUp(_emailTextController.text,
                        _passwordTextController.text);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.firstName = _firstNameTextController.text;
    userModel.lastName = _lastNameTextController.text;
    userModel.userName = _userNameTextController.text;
    userModel.email = _emailTextController.text;
    userModel.phoneNumber = _numberTextController.text;
    userModel.password = _passwordTextController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }
}
