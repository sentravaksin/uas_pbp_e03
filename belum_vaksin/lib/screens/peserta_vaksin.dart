// // page daftar peserta vaksinasi
// import 'package:efek_samping/lapor.dart';
// import 'package:flutter/material.dart';
// import 'package:belum_vaksin/belum_vaksin.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:daftar_nakes/daftar_nakes.dart';
// import 'package:jadwal/jadwal.dart';
// import 'package:belum_vaksin/belum_vaksin.dart';

// class DaftarPesertaVaksin extends StatefulWidget {
//   const DaftarPesertaVaksin({Key? key}) : super(key: key);

//   @override
//   _PesertaVaksinState createState() => _PesertaVaksinState();
// }

// class _PesertaVaksinState extends State<DaftarPesertaVaksin> {
//   // method for getting the data
//   Future<List<PesertaVaksin>> getLaporan() async {
//     const url = 'http://sentra-vaksin.herokuapp.com/api/efek-samping/laporan';
//     var response = await http.get(Uri.parse(url));
//     var jsonData = json.decode(response.body);
//     //var jsonArray = jsonData['data'];

//     List<EfekSamping> reports = [];

//     for (var jsonLaporan in jsonData) {
//       String nama = jsonLaporan['nama'];
//       int nik = jsonLaporan['nik'];
//       int no_hp = jsonLaporan['no_hp'];
//       String alamat = jsonLaporan['alamat'];
//       String vaksin = jsonLaporan['vaksin'];
//       String gejala = jsonLaporan['gejala'];
//       String token = jsonLaporan['token'];

//       EfekSamping efekSamping =
//           EfekSamping(nama, nik, no_hp, alamat, vaksin, gejala, token);
//       reports.add(efekSamping);
//     }
//     List<EfekSamping> reversedReports = reports.reversed.toList();
//     return reversedReports;
//   }

//   // color system
//   var pinkAccent = Color.fromARGB(255, 255, 144, 181);
//   var fontColor = Color.fromARGB(255, 156, 54, 88);

//   // for navigation TODO: UPDATE INI
//   void onSelected(BuildContext context, int item) {
//     switch (item) {
//       case 0:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Lapor()));
//         break;
//       case 1:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Lapor()));
//         break;
//       case 2:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Lapor()));
//         break;
//       case 3:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Lapor()));
//         break;
//       default:
//     }
//   }

//   // card widget

//   // widget build

// }