import 'package:flutter/material.dart';
import 'package:daftar_nakes/daftar_nakes.dart';
// import 'package:daftar_nakes/User_Model/User_Model.dart';
// File-file modul efek-samping
import 'package:efek_samping/EfekSamping.dart';
import 'package:efek_samping/lapor.dart'; // Import ini buat ke halaman lapor efek samping
import 'package:efek_samping/laporan.dart'; // Import ini buat ke halaman daftar laporan efek samping

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Daftar_Nakes()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Daftar_Nakes()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    // Kalo nanti misal mau pake theme, fooderlich nya bisa dicustom
    //final theme = FooderlichTheme.light();

    return MaterialApp(
      title: 'Flutter Demo',
      //theme: theme,
      // home : sesuaikan dengan halaman masing2 buat dicoba
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
    );
  }
}
