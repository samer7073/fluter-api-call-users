// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_api_users/models/usersmodel.dart';

import '../services/user_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest Api Call"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.fullName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.location.city + ", " + user.location.country),
                Text(user.bob.date.toString()),
                Text(user.location.corrdinate.latitude.toString() +
                    ", " +
                    user.location.corrdinate.longitude.toString())
              ],
            ),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(user.picture.medium)),
          );
        },
      ),
    );
  }

  Future<void> getUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
      print(users);
    });
  }
}
