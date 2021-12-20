import 'package:flutter/material.dart';
import 'EfekSamping.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Laporan extends StatefulWidget {
  const Laporan({Key? key}) : super(key: key);

  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  List<EfekSamping> laporan = List.empty();
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }
  // void getData() async {
  //   var response =
  //       await Dio().get('http://10.0.2.2:8000/api/efek-samping/laporan');

  //   var fetched = response.data;
  //   // print(fetched);
  //   // print(fetched[0]['nik'].runtimeType);
  //   // print(fetched[0]['no_hp'].runtimeType);

  //   for (var i = 0; i < fetched.length; i++) {
  //     String nama = fetched[i]['nama'];
  //     String nik = fetched[i]['nik'].toString();
  //     String no_hp = fetched[i]['no_hp'].toString();
  //     String alamat = fetched[i]['alamat'];
  //     String vaksin = fetched[i]['vaksin'];
  //     String gejala = fetched[i]['gejala'];
  //     String token = fetched[i]['token'].toString();

  //     laporan.add(EfekSamping(nama, nik, no_hp, alamat, vaksin, gejala, token));
  //   }

  //   print(laporan);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan Efek Samping"),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: laporan.length,
              itemBuilder: (BuildContext context, int index) {
                return buildEfekSampingCard(laporan[index]);
              })),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
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
        Text(efekSamping.nama),
        Text(efekSamping.nik.toString()),
        Text(efekSamping.noHp.toString()),
        Text(efekSamping.alamat),
        Text(efekSamping.vaksin),
        Text(efekSamping.gejala),
        Text(efekSamping.token),
      ],
    ),
  );
}
