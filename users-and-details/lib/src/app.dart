import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:users_and_details/models/user.dart';
import 'package:users_and_details/screens/user_screen.dart';

Future fetchData() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/users');

  if (response.statusCode == 200) {
    List futureUsers = List<User>();
    var jsonUsers = jsonDecode(response.body);
    for (var jsonUser in jsonUsers) {
      User user = User.fromJson(jsonUser);
      futureUsers.add(user);
    }
    return futureUsers;
  } else {
    throw Exception('Failed to load data');
  }
}

class UsersApp extends StatefulWidget {
  UsersApp({Key key}) : super(key: key);

  @override
  _UsersAppState createState() => _UsersAppState();
}

class _UsersAppState extends State<UsersApp> {
  Future futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserScreen(futureUsers: futureUsers),
    );
  }
}
