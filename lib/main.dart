import 'package:belum_vaksin/screens/confirm_registrasi.dart';
import 'package:belum_vaksin/screens/registrasi_vaksin.dart';
import 'package:belum_vaksin/screens/peserta_vaksin.dart';
import 'package:flutter/material.dart';
import 'package:daftar_nakes/daftar_nakes.dart';
// import 'package:daftar_nakes/User_Model/User_Model.dart';
// File-file modul efek-samping
import 'package:efek_samping/EfekSamping.dart'; // Import ini buat ke halaman registrasi vaksin
import 'package:efek_samping/lapor.dart'; // Import ini buat ke halaman lapor efek samping
import 'package:efek_samping/laporan.dart'; // Import ini buat ke halaman daftar laporan efek samping
import 'package:jadwal/screen/jadwal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  var offWhite = Color.fromARGB(255, 255, 248, 250);
  var pinkAccent = Color.fromARGB(255, 255, 144, 181);
  var fontColor = Color.fromARGB(255, 156, 54, 88);
  int index = 0;
  List<Widget> bodies = [Jadwal(), ConfirmPage(), Lapor(), Daftar_Nakes()];
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    // color system

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //theme: theme,
      // home : sesuaikan dengan halaman masing2 buat dicoba
      home: Scaffold(
        body: bodies[index],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (val) {
            setState(() {
              print(val);
              index = val;
            });
          }, //(item) => onSelected(context, item),
          unselectedItemColor: Color.fromARGB(255, 105, 105, 105),
          selectedItemColor: pinkAccent,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined),
              label: 'Jadwal Vaksin',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'Daftar Vaksin',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.add_comment_outlined),
              label: 'Lapor',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.badge_outlined),
              label: 'Daftar Nakes',
            ),
          ],
        ),
      ),
    );
  }
}
