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
  List<Widget> bodies = [ConfirmPage(), Laporan(), Laporan(), Daftar_Nakes()];
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
              icon: Icon(Icons.assignment_ind_outlined),
              label: 'Peserta Vaksin',
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
=======
<<<<<<< HEAD
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Sentra Vaksin"),
              actions: [
                // Menu-menu khusus admin
                PopupMenuButton<int>(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                        value: 0,
                        child: Text(
                          "Jadwal Vaksin",
                          style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
                        )),
                    PopupMenuItem<int>(
                        value: 1,
                        child: Text(
                          "Registrasi Vaksin",
                          style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
                        )),
                  ],
                )
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Menu-menu buat user, argumen 1 judul argumen 2 fungsi widgetnya
                buildMenuModul("Jadwal Vaksinasi", Lapor()),
                buildMenuModul("Jadwal vaksinasi", Lapor()),
                buildMenuModul("Jadwal vaksinasi", Lapor()),
              ],
            )),
      ),
    );
  }
}

class buildMenuModul extends StatelessWidget {
  buildMenuModul(this.title, this.modul);
  final String? title;
  final Widget? modul;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 150,
        width: 300,
        child: Card(
          color: Colors.lightBlue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: new BorderSide(color: Colors.lightBlue, width: 1.0)),
          child: InkWell(
            child: Center(
              child: Text(
                title!,
                style: TextStyle(
                    fontSize: 27, fontFamily: 'ABeeZee', color: Colors.white),
              ),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => modul!)),
          ),
        ),
      ),
=======
      home: ConfirmPage(),
>>>>>>> a16924205945d0b1ce1616cf7b6ee6e5092ca166
>>>>>>> a98485ea4dbfe6e8d1c882b06ec28b0bd5a02423
    );
  }
}
