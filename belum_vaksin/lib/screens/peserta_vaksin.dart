// page daftar peserta vaksinasi
import 'package:efek_samping/lapor.dart';
import 'package:flutter/material.dart';
import 'package:belum_vaksin/belum_vaksin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:daftar_nakes/daftar_nakes.dart';
import 'package:jadwal/jadwal.dart';
import 'package:belum_vaksin/belum_vaksin.dart';

import '../widgets/text_widgets.dart';

class DaftarPesertaVaksin extends StatefulWidget {
  const DaftarPesertaVaksin({Key? key}) : super(key: key);

  @override
  _PesertaVaksinState createState() => _PesertaVaksinState();
}

class _PesertaVaksinState extends State<DaftarPesertaVaksin> {
  // method for getting the data
  Future<List<PesertaVaksin>> daftarPesertaVaksin() async {
    const url = 'http://sentra-vaksin.herokuapp.com/api/belum_vaksin/';

    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);

    List<PesertaVaksin> daftarPeserta = [];

    for (var json in jsonData) {
      var waktu = json['waktu'];
      String tempat_pelaksanaan = json['tempat_pelaksanaan'];
      String jenis_vaksin = json['jenis_vaksin'];
      String nama_peserta = json['nama_peserta'];
      String nik = json['nik'];
      String no_telp = json['no_telp'];

      PesertaVaksin pesertaVaksin = PesertaVaksin(
        waktu!, tempat_pelaksanaan, jenis_vaksin, nama_peserta, nik, no_telp,
        // id, sesi, token belom ngerti harus gimana
      );
      daftarPeserta.add(pesertaVaksin);
    }

    List<PesertaVaksin> reversed = daftarPeserta.reversed.toList();
    return reversed;
  }

  // color system
  var offWhite = Color.fromARGB(255, 255, 248, 250);
  var pinkAccent = Color.fromARGB(255, 255, 144, 181);
  var fontColor = Color.fromARGB(255, 156, 54, 88);

  // for navigation TODO: UPDATE INI
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lapor()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lapor()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lapor()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lapor()));
        break;
      default:
    }
  }

  // card widget
  Widget CardPesertaVaksin(BuildContext context, PesertaVaksin pesertaVaksin) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: offWhite,
        border: Border.all(color: pinkAccent),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Detail Peserta",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: fontColor,
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomText("Nama"),
                  CustomText("NIK"),
                  CustomText("No. Telepon"),
                ],
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomText(": " + pesertaVaksin.nama_peserta),
                  CustomText(": " + pesertaVaksin.nik.toString()),
                  CustomText(": " + pesertaVaksin.no_telp.toString()),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Detail Vaksinasi",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: fontColor,
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomText("Tanggal"),
                  CustomText("Lokasi"),
                  CustomText("Jenis Vaksin"),
                ],
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomText(": " + pesertaVaksin.waktu),
                  CustomText(": " + pesertaVaksin.tempat_pelaksanaan),
                  CustomText(": " + pesertaVaksin.jenis_vaksin),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // widget build
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // app bar
      appBar: AppBar(
        title: Text("Sentra Vaksin"),
        backgroundColor: pinkAccent,
        actions: [
          // TODO: UPDATE INI
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "Jadwal Vaksin",
                    style: TextStyle(fontSize: 20),
                  )),
              PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    "Registrasi Vaksin",
                    style: TextStyle(fontSize: 20),
                  )),
              PopupMenuItem<int>(
                  value: 2,
                  child: Text(
                    "Lapor Efek Samping",
                    style: TextStyle(fontSize: 20),
                  )),
              PopupMenuItem<int>(
                  value: 3,
                  child: Text(
                    "Daftar Nakes",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          )
        ],
      ),

      // body
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Daftar Peserta Vaksin",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: fontColor,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                FutureBuilder<List<PesertaVaksin>>(
                    future: daftarPesertaVaksin(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<PesertaVaksin> daftarPeserta = snapshot.data!;

                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, int index) {
                              PesertaVaksin pesertaVaksin =
                                  daftarPeserta[index];
                              return CardPesertaVaksin(context, pesertaVaksin);
                              // return Text(index.toString() + ". " + pesertaVaksin.nama_peserta); // DEBUG
                            });
                      }
                      return Center();
                    }),
              ],
            ),
          ),
        ),
      ),

      // bottom navbar
      // TODO: UPDATE INI
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedItemColor: Color.fromARGB(255, 105, 105, 105),
      //   selectedItemColor: pinkAccent,
      //   type: BottomNavigationBarType.fixed,
      //   items: <BottomNavigationBarItem>[
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.access_time_outlined),
      //       label: 'Jadwal Vaksin',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.assignment_ind_outlined),
      //       label: 'Registrasi Vaksin',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.add_comment_outlined),
      //       label: 'Lapor',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.badge_outlined),
      //       label: 'Daftar Nakes',
      //     ),
      //   ],
      // ),
    );
  }
}
