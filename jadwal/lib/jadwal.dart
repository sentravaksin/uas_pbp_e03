// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentra Vaksin - Mobile Dev Phase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Jadwal Vaksinasi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> waktu = <String>['22-12-2021', '23-12-2021'];
  List<String> tempatPelaksanaan = <String>['Jakarta', 'Lap. UI'];
  List<String> jenisVaksin = <String>['AZ', 'Pfizer'];
  List<int> kuota = <int>[1, 0];
  List<int> kontak = <int>[0812, 0825];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: waktu.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text('Sesi tanggal ${waktu[index]}'),
                  Text('${tempatPelaksanaan[index]}'),
                  Text('Vaksin ${jenisVaksin[index]}'),
                  Text('Tersisa ${kuota[index]} kuota'),
                  Text('Kontak: +62${kontak[index]}'),
                ],
              ));
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )),
    );
  }
}
