library daftar_nakes;

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

List<User>? user;

class _Daftar_NakesState extends State<Daftar_Nakes> {
  String name = '';

  // void getres() {}

  @override
  Widget build(BuildContext context) {
    // User.connectToAPI().then((value) {
    //   user = (user == null) ? value : user;
    //   print(user.toString());
    // });
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
                        // print(user.toString());
                        setState(() {});
                      });
                    },
                    child: Text('get user')),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => _makePopup());
                      },
                      child: Text("popup uhuy")),
                )
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

  GestureDetector _makePopup() {
    return GestureDetector(
      // onVerticalDragDown: (context) {
      //   print('dragged down');
      // },
      child: AlertDialog(
        content: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text('asdasd'),
              GestureDetector(
                child: Text('click me'),
                onTap: () {
                  print('asdasd');
                },
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    );
  }

  GestureDetector createCell(String isi) {
    return GestureDetector(
      onTap: () {
        print(isi);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
        // height: 10.0,
        // width: 10.0,
        color: Colors.pink,
        child: Text(isi),
      ),
    );
  }

  Column displayUser() {
    Column cols = Column(
      children: [],
    );
    if (user != null) {
      for (int i = 0; i < user!.length; i++) {
        User item = user!.elementAt(i);
        print(item);
        cols.children
            .add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          createCell(item.name),
          createCell(item.umur),
          createCell(item.pendidikan),
          createCell(item.rs),
        ]));
      }
    }
    return cols;
  }
}
