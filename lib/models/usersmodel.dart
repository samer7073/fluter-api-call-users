import 'package:flutter_application_api_users/models/userBob.dart';
import 'package:flutter_application_api_users/models/userName.dart';
import 'package:flutter_application_api_users/models/user_location.dart';
import 'package:flutter_application_api_users/models/userpicture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final UserName name;
  final UserBob bob;
  final UserLocation location;
  final UserPicture picture;
  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.nat,
      required this.name,
      required this.bob,
      required this.location,
      required this.picture});

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);

    final dob = UserBob.fromMap(e['dob']);

    final picture = UserPicture.formMap(e['picture']);
    final location = UserLocation.fromMap(e['location']);
    return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        nat: e['nat'],
        name: name,
        bob: dob,
        location: location,
        picture: picture);
  }
}
