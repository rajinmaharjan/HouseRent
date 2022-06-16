import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? phoneNumber;
  String? password;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.userName,
    this.phoneNumber,
    this.password,
  });

  //data from server

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
