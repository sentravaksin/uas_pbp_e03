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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Kalo nanti misal mau pake theme, fooderlich nya bisa dicustom
    //final theme = FooderlichTheme.light();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //theme: theme,
      // home : sesuaikan dengan halaman masing2 buat dicoba
      home: Laporan(),
    );
  }
}
