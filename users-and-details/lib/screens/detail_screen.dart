import 'package:flutter/material.dart';
import 'package:users_and_details/models/user.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("User Details"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                user.name,
                style: TextStyle(fontSize: 24),
              ),
              Text(
                user.username,
                style: TextStyle(fontSize: 24),
              ),
              Text(
                user.email,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ));
  }
}
