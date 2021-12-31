library daftar_nakes;

import 'package:belum_vaksin/screens/registrasi_vaksin.dart';
import 'package:belum_vaksin/screens/peserta_vaksin.dart';
import 'package:belum_vaksin/screens/confirm_registrasi.dart';
import 'package:flutter/material.dart';
import 'User_Model/User_Model.dart';
// import 'package:jadwal/screens/confirm_registrasi.dart';
import 'package:efek_samping/lapor.dart';
import 'package:efek_samping/EfekSamping.dart'; // Import ini buat ke halaman registrasi vaksin
import 'package:efek_samping/lapor.dart'; // Import ini buat ke halaman lapor efek samping
import 'package:efek_samping/laporan.dart'; // Import ini buat ke halaman daftar laporan efek samping

// daftar_nakes:
//     path: ../daftar_nakes
//   jadwal:
//     path: ../jadwal
//   efek_samping:
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
  var offWhite = Color.fromARGB(255, 255, 248, 250);
  var pinkAccent = Color.fromARGB(255, 255, 144, 181);
  var fontColor = Color.fromARGB(255, 156, 54, 88);
  void onSelected(BuildContext context, int item) {
    // print('masuk');
  }
  // void getres() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Nakes'),
        backgroundColor: pinkAccent,
        // leading: ElevatedButton(
        //     style: ElevatedButton.styleFrom(elevation: 0),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     child: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   count.toString(),
              //   style: Theme.of(context).textTheme.headline4,
              // ),
              // ElevatedButton(◢◤◢◤◢◤
              //     onPressed: () {
              //       User.connectToAPI().then((value) {
              //         user = value;
              //         // print(user.toString());
              //         setState(() {});
              //       });
              //     },
              //     child: Text('get Nakes')),
              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: ElevatedButton(
              //       onPressed: () {
              //         showDialog(
              //             context: context,
              //             builder: (context) => _makePopup());
              //       },
              //       child: Text("popup uhuy")),
              // ),
              displayUser()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          User.connectToAPI().then((value) {
            user = value;
            // print(user.toString());
            setState(() {});
          });
        },
      ),
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

  // Widget createCell(String isi) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(30.0),
  //           side: new BorderSide(color: Colors.lightBlue, width: 1.0)),
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
  //         child: Container(
  //           child: Column(children: [
  //             Text("Nama    : ${efekSamping.nama}",
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
  //             Text("NIK     : ${efekSamping.nik.toString()}",
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
  //             Text("No HP   : ${efekSamping.no_hp.toString()}",
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
  //             Text("Alamat  : ${efekSamping.alamat}",
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
  //             Text("Vaksin  : ${efekSamping.vaksin}",
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
  //             Text("Gejala  : ${efekSamping.gejala}",
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
  //             Text("Token   : ${efekSamping.token}",
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'))
  //           ], crossAxisAlignment: CrossAxisAlignment.start),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Column displayUser() {
    Column cols = Column(
      children: [],
    );
    if (user != null) {
      for (int i = 0; i < user!.length; i++) {
        User item = user!.elementAt(i);
        // print(item);
        cols.children
            .add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: new BorderSide(color: Colors.lightBlue, width: 1.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
                child: Container(
                  child: Column(children: [
                    Text("Nama         : ${item.name}",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
                    Text("Umur         : ${item.umur}",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
                    Text("Pendidikan   : ${item.pendidikan}",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
                    Text("Rumah Sakit  : ${item.rs}",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
                  ], crossAxisAlignment: CrossAxisAlignment.start),
                ),
              ),
            ),
          )
        ]));
      }
    }
    return cols;
  }
}
