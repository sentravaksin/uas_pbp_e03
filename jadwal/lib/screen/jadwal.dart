// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './edit_jadwal.dart' as edit_jadwal;
import './add_jadwal.dart' as add_jadwal;

import '../model/SesiVaksinasi.dart';
import '../model/SesiVaksinasiWithId.dart';

Future<String> deleteData(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('http://sentra-vaksin.herokuapp.com/api/jadwal/$id/delete/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return "Success";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

Future<List<SesiVaksinasiWithId>> fetchData() async {
  final response = await http
      .get(Uri.parse('http://sentra-vaksin.herokuapp.com/api/jadwal/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return sesiVaksinasiWithIdFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

void main() {
  runApp(Jadwal());
}

class Jadwal extends StatelessWidget {
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
  late Future<List<SesiVaksinasiWithId>> futureSesi;

  @override
  void initState() {
    super.initState();
    futureSesi = fetchData();
  }

  // List<String> id = <String>['asda', 'asd'];
  // List<String> waktu = <String>['22-12-2021', '23-12-2021'];
  // List<String> tempatPelaksanaan = <String>['Jakarta', 'Lap. UI'];
  // List<String> jenisVaksin = <String>['AZ', 'Pfizer'];
  // List<int> kuota = <int>[1, 0];
  // List<int> kontak = <int>[0812, 0825];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: FutureBuilder<List<SesiVaksinasiWithId>>(
          future: futureSesi,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<SesiVaksinasiWithId>? data = snapshot.data;
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: data!.length,
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
                                    'Sesi tanggal ${data[index].waktu}',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    '${data[index].tempatPelaksanaan}',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Vaksin ${data[index].jenisVaksin}',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Tersisa ${data[index].kuota} kuota',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Hubungi kontak +62${data[index].kontak} untuk info lebih lanjut',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.start,
                                  children: [
                                    // TextButton(
                                    //     style: ButtonStyle(
                                    //       backgroundColor:
                                    //           MaterialStateProperty.all<Color>(
                                    //               Colors.pink),
                                    //     ),
                                    //     onPressed: () {
                                    //       // Perform some action
                                    //       print('Debug sebelum navigator');
                                    //       SesiVaksinasiWithId editedSesi =
                                    //           data[index];
                                    //       Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               const edit_jadwal.MyAppForm(),
                                    //           // Pass the arguments as part of the RouteSettings. The
                                    //           // DetailScreen reads the arguments from these settings.
                                    //           settings: RouteSettings(
                                    //             arguments: editedSesi,
                                    //           ),
                                    //         ),
                                    //       );
                                    //     },
                                    //     child: const Text('Edit',
                                    //         style: TextStyle(
                                    //           color: Colors.white,
                                    //         ))),
                                    TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.pink),
                                        ),
                                        onPressed: () {
                                          // Perform some action
                                          deleteData('${data[index].id}');
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          super.widget));
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const add_jadwal.MyAppForm(),
                            // Pass the arguments as part of the RouteSettings. The
                            // DetailScreen reads the arguments from these settings.
                          ),
                        );
                      },
                      color: Colors.pink,
                      child: const Text(
                        'Tambah Sesi Vaksinasi Baru',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
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
