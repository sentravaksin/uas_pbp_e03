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
      appBar: AppBar(
        title: Text("Laporan Efek Samping"),
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

Widget buildEfekSampingCard(EfekSamping efekSamping) {
  return Card(
    child: Column(
      children: [
        Text("Nama :${efekSamping.nama}"),
        Text("NIK ${efekSamping.nik.toString()}"),
        Text("No HP ${efekSamping.no_hp.toString()}"),
        Text("Alamat ${efekSamping.alamat}"),
        Text("Vaksin ${efekSamping.vaksin}"),
        Text("Gejala ${efekSamping.gejala}"),
        Text("Token ${efekSamping.token}")
      ],
    ),
  );
}
