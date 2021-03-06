import 'package:flutter/material.dart';
import 'EfekSamping.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Laporan extends StatefulWidget {
  const Laporan({Key? key}) : super(key: key);

  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  Future<List<EfekSamping>> getLaporan() async {
    //const url = 'http://10.0.2.2:8000/api/efek-samping/laporan';
    const url = 'http://sentra-vaksin.herokuapp.com/api/efek-samping/laporan';
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    //var jsonArray = jsonData['data'];

    List<EfekSamping> reports = [];

    for (var jsonLaporan in jsonData) {
      String nama = jsonLaporan['nama'];
      int nik = jsonLaporan['nik'];
      int no_hp = jsonLaporan['no_hp'];
      String alamat = jsonLaporan['alamat'];
      String vaksin = jsonLaporan['vaksin'];
      String gejala = jsonLaporan['gejala'];
      String token = jsonLaporan['token'];

      EfekSamping efekSamping =
          EfekSamping(nama, nik, no_hp, alamat, vaksin, gejala, token);
      reports.add(efekSamping);
    }
    List<EfekSamping> reversedReports = reports.reversed.toList();
    return reversedReports;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Laporan Efek Samping",
          style: TextStyle(fontFamily: 'ABeeZee', fontSize: 27),
        ),
      ),
      body: SafeArea(
          child: FutureBuilder<List<EfekSamping>>(
        future: getLaporan(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<EfekSamping> reports = snapshot.data!;
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  EfekSamping laporan = reports[index];
                  return buildEfekSampingCard(laporan);
                });
          }
          return Center();
        },
      )),
    );
  }
}

Widget buildEfekSampingCard(EfekSamping efekSamping) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: new BorderSide(color: Colors.lightBlue, width: 1.0)),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
        child: Container(
          child: Column(children: [
            Text("Nama    : ${efekSamping.nama}",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
            Text("NIK     : ${efekSamping.nik.toString()}",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
            Text("No HP   : ${efekSamping.no_hp.toString()}",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
            Text("Alamat  : ${efekSamping.alamat}",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
            Text("Vaksin  : ${efekSamping.vaksin}",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
            Text("Gejala  : ${efekSamping.gejala}",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee')),
            Text("Token   : ${efekSamping.token}",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'))
          ], crossAxisAlignment: CrossAxisAlignment.start),
        ),
      ),
    ),
  );
}
