import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uId;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? phoneNumber;
  String? password;

  UserModel({
    this.uId,
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
      uId: map['uId'],
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
      'uId': uId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
