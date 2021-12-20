import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'EfekSamping.dart';
import 'dart:convert';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String? nama = "";
  String? nik = "";
  String? noHp = "";
  String? alamat = "";
  String? vaksin = "";
  String? gejala = "";
  String? token = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget buildNama(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(labelText: "Nama"),
      maxLength: 20,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi data ini';
        }

        return null;
      },
      onSaved: (value) {
        nama = value;
      },
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Widget buildNIK(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(labelText: "NIK"),
      maxLength: 20,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi data ini';
        } else if (!isNumeric(value)) {
          return 'Mohon isi dengan angka';
        }

        return null;
      },
      onSaved: (value) {
        nik = value;
      },
    );
  }

  Widget buildNoHP(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(labelText: "No HP"),
      maxLength: 20,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi data ini';
        } else if (!isNumeric(value)) {
          return 'Mohon isi dengan angka';
        }

        return null;
      },
      onSaved: (value) {
        noHp = value;
      },
    );
  }

  Widget buildAlamat(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(labelText: "Alamat"),
      maxLength: 20,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi data ini';
        }

        return null;
      },
      onSaved: (value) {
        alamat = value;
      },
    );
  }

  Widget buildVaksin(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(labelText: "Vaksin"),
      maxLength: 20,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi data ini';
        }

        return null;
      },
      onSaved: (value) {
        vaksin = value;
      },
    );
  }

  Widget buildGejala(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(labelText: "Gejala"),
      maxLength: 20,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi data ini';
        }

        return null;
      },
      onSaved: (value) {
        gejala = value;
      },
    );
  }

  Widget buildToken(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(labelText: "Token"),
      maxLength: 20,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi data ini';
        }

        return null;
      },
      onSaved: (value) {
        token = value;
      },
    );
  }

  // Future<http.Response> createLaporan(EfekSamping efekSamping) {
  //   return http.post(
  //     Uri.parse('http://10.0.2.2:8000/api/efek-samping/laporan'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "nama": efekSamping.nama,
  //       "nik": efekSamping.nik,
  //       "no_hp": efekSamping.noHp,
  //       "alamat": efekSamping.alamat,
  //       "vaksin": efekSamping.vaksin,
  //       "gejala": efekSamping.gejala,
  //       "token": efekSamping.token,
  //     }),
  //   );
  // }

  Widget buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final isValid = _formKey.currentState!.validate();
        if (isValid) {
          _formKey.currentState!.save();

          final message = 'Nama : $nama\nNIK: $nik';
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          var efekSamping = EfekSamping(
              nama!, nik!, noHp!, alamat!, vaksin!, gejala!, token!);
          // createLaporan(efekSamping);
        }
      },
      child: Text("Submit"),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sentra Vaksin"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Title(
                    color: Colors.blue,
                    child: Text(
                      "Laporan Efek Samping Vaksinasi",
                      style: Theme.of(context).textTheme.headline2,
                    )),
                buildNama(context),
                buildNIK(context),
                buildNoHP(context),
                buildAlamat(context),
                buildVaksin(context),
                buildGejala(context),
                buildToken(context),
                buildSubmitButton(context),
              ],
            ),
          ),
        ),
      ),
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
