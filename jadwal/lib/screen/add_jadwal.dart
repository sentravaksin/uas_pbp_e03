import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/SesiVaksinasi.dart';

void main() {
  runApp(MyAppForm());
}

Future<dynamic> addData(SesiVaksinasi sesiVaksinasi) async {
  final response = await http.post(
    Uri.parse('https://sentra-vaksin.herokuapp.com/api/jadwal/create/'),
    headers: {
      "Access-Control_Allow_Origin": "*",
      "Content-Type": "application/json; charset=utf-8",
    },
    body: jsonEncode(sesiVaksinasi),
  );
  print(response.statusCode);
  if (response.statusCode == 201) {
    return "Success";
  }
  throw Exception('Failed to save');
}

class MyAppForm extends StatelessWidget {
  const MyAppForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentra Vaksin - Mobile Dev Phase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Info Sesi Vaksinasi Terbaru'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _status = "";
  late String _waktu;
  late String _tempatPelaksanaan;
  late String _jenisVaksin;
  late int _kuota;
  late String _kontak;

  final _formKey = GlobalKey<FormState>();

  void _updateStatus(String status) {
    setState(() {
      _status = status;
    });
  }

  DateTime selectedDate = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        // berubah
        selectedDate = picked;
        _dateController.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _dateController.text = selectedDate.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter the field';
                        }
                        _waktu = value!;
                      },
                      onChanged: (String value) {
                        _updateStatus("");
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Waktu',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // TextFormField(
                    //   controller: _dateController,
                    //   validator: (value) {
                    //     if (value?.isEmpty ?? true) {
                    //       return 'Please enter the field';
                    //     }
                    //     _waktu = value!;
                    //   },
                    //   onChanged: (String value) {
                    //     _updateStatus("");
                    //   },
                    //   keyboardType: TextInputType.datetime,
                    //   decoration: InputDecoration(
                    //     labelText: 'Waktu',
                    //     border: OutlineInputBorder(),
                    //     suffixIcon: IconButton(
                    //       icon: Icon(Icons.calendar_today_rounded),
                    //       onPressed: () => _selectDate(context),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    TextFormField(
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter the field';
                        }
                        _tempatPelaksanaan = value!;
                      },
                      onChanged: (String value) {
                        _updateStatus("");
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Tempat Pelaksanaan',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter the field';
                        }
                        _jenisVaksin = value!;
                      },
                      onChanged: (String value) {
                        _updateStatus("");
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Jenis Vaksin',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter the field';
                        }
                        _kuota = int.parse(value!);
                      },
                      onChanged: (String value) {
                        _updateStatus("");
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Kuota',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter the field';
                        }
                        _kontak = value!;
                      },
                      onChanged: (String value) {
                        _updateStatus("");
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Kontak',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ])),
              const SizedBox(
                height: 15,
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      SesiVaksinasi newSesi = SesiVaksinasi(
                        waktu: _waktu,
                        tempatPelaksanaan: _tempatPelaksanaan,
                        jenisVaksin: _jenisVaksin,
                        kuota: _kuota,
                        kontak: _kontak,
                      );

                      addData(newSesi);
                      // if success
                      Navigator.pop(context);
                    }
                  },
                  color: Colors.pink,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                _status,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
