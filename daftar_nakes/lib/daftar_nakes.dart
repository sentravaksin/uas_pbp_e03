library daftar_nakes;

import 'dart:html';

import 'package:flutter/material.dart';
import 'User_Model/User_Model.dart';

/// A daftar nakes page.
class Daftar_Nakes extends StatefulWidget {
  // User user;
  const Daftar_Nakes({Key? key}) : super(key: key);
  // Daftar_Nakes(this.user);

  @override
  _Daftar_NakesState createState() => _Daftar_NakesState();
}

int count = 0;
//https://reqres.in/

String dogImage =
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fdog%2F&psig=AOvVaw0WhYFdnEb1n98HMz1vfFd-&ust=1639475250715000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJju6rG_4PQCFQAAAAAdAAAAABAS';

class _Daftar_NakesState extends State<Daftar_Nakes> {
  String name = '';
  User? user;

  // void getres() {}

  @override
  Widget build(BuildContext context) {
    //User tmep =
    User.connectToAPI().then((value) {
      user = value;
    });
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Daftar Nakes'),
            leading: ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new)),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                displayUser(),
                ElevatedButton(
                    onPressed: () {
                      User.connectToAPI().then((value) {
                        user = value;
                        setState(() {});
                      });
                    },
                    child: Text('get user'))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              count++;
              setState(() {});
            },
          )),
    );
  }

  Column displayUser() {
    return (user == null)
        ? Column()
        : Column(
            children: [
              Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.zero,
                  child: Image(
                    image:
                        NetworkImage((user == null) ? dogImage : user!.avatar),
                    fit: BoxFit.cover,
                  )),
              Text((user == null)
                  ? " "
                  : user!.id + " " + user!.email + " " + user!.name)
            ],
          );
  }
}
