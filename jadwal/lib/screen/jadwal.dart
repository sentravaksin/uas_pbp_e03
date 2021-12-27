// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/SesiVaksinasi.dart';

Future<List<SesiVaksinasi>> fetchData() async {
  final response = await http
      .get(Uri.parse('http://sentra-vaksin.herokuapp.com/api/jadwal/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return sesiVaksinasiFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

void main() {
  runApp(MyApp());
}

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
  late Future<List<SesiVaksinasi>> futureSesi;

  @override
  void initState() {
    super.initState();
    futureSesi = fetchData();
  }

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
      body: SafeArea(
        child: FutureBuilder<List<SesiVaksinasi>>(
          future: futureSesi,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<SesiVaksinasi>? data = snapshot.data;
              return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: waktu.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Sesi tanggal ${waktu[index]}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              '${tempatPelaksanaan[index]}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Vaksin ${jenisVaksin[index]}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Tersisa ${kuota[index]} kuota',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Hubungi kontak +62${kontak[index]} untuk info lebih lanjut',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.pink),
                                  ),
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: const Text('Edit',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))),
                              TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.pink),
                                  ),
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: const Text('Delete',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))),
                            ],
                          ),
                        ],
                      ));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
