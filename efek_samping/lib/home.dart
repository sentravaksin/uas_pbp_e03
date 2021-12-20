import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sentra Vaksin',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Title(
                  color: Colors.blue,
                  child: Text(
                    "Laporan Efek Samping Vaksinasi",
                    style: Theme.of(context).textTheme.headline2,
                  )),
              Text(
                'Nama',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text('NIK'),
              Text('No HP'),
              Text('Alamat'),
              Text('Vaksin'),
              Text('Gejala'),
              Text('Token'),
            ],
          ),
        ),
      )),
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
