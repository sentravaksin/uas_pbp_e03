// page form registrasi vaksin
import 'package:flutter/material.dart';
import 'package:belum_vaksin/belum_vaksin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:daftar_nakes/daftar_nakes.dart';

class RegistrasiVaksin extends StatefulWidget {
  const RegistrasiVaksin({Key? key}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<RegistrasiVaksin> {
  // form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // attibutes for form key
  var waktu;
  String? tempat_pelaksanaan;
  String? jenis_vaksin;
  String? nama_peserta;
  int? nik;
  int? no_telp;
  var id;
  var sesi;
  var token;

  // form result
  String? submitted;

  // for navigation TODO: UPDATE INI
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
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Daftar_Nakes()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        title: Text("Sentra Vaksin"),
        actions: [
          // TODO: UPDATE INI
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text("Daftar Nakes")),
              PopupMenuItem<int>(value: 1, child: Text("Jadwal")),
              PopupMenuItem<int>(value: 2, child: Text("Belum Vaksin"))
            ],
          )
        ],
      ),

      // body
      // TODO: IMPLEMENT BODY

      // bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: 'Jadwal Vaksin',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Daftar Vaksin',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_comment_outlined),
            label: 'Lapor',
          ),
        ],
      ),
    );
  }
}