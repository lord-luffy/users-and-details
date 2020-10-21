import 'package:flutter/material.dart';
import 'package:users_and_details/screens/detail_screen.dart';

class UserScreen extends StatelessWidget {
  final Future futureUsers;

  UserScreen({Key key, @required this.futureUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var users = snapshot.data;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                          settings: RouteSettings(
                            arguments: users[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
