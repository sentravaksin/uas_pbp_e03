import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'EfekSamping.dart';
import 'dart:convert';

class Lapor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LaporState();
  }
}

class LaporState extends State<Lapor> {
  String? nama;
  int? nik;
  int? no_hp;
  String? alamat;
  String? vaksin;
  String? gejala;
  String? token;

  String? hasil;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget buildNama(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Nama",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ))),
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
      decoration: InputDecoration(
          labelText: "NIK",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ))),
      maxLength: 16,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi data ini';
        } else if (!isNumeric(value)) {
          return 'Mohon isi dengan angka';
        }

        return null;
      },
      onSaved: (value) {
        nik = int.parse(value!);
      },
    );
  }

  Widget buildNoHP(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(
          labelText: "No HP",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ))),
      maxLength: 12,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi data ini';
        } else if (!isNumeric(value)) {
          return 'Mohon isi dengan angka';
        }

        return null;
      },
      onSaved: (value) {
        no_hp = int.parse(value!);
      },
    );
  }

  Widget buildAlamat(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Alamat",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ))),
      maxLength: 32,
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
      decoration: InputDecoration(
          labelText: "Vaksin",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ))),
      maxLength: 7,
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
      decoration: InputDecoration(
          labelText: "Gejala",
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ))),
      maxLength: 140,
      maxLines: 5,
      keyboardType: TextInputType.multiline,
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
      decoration: InputDecoration(
          labelText: "Token",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ))),
      maxLength: 5,
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

  Future<String> createLaporan(EfekSamping efekSamping) async {
    //final String apiUrl = 'http://10.0.2.2:8000/api/efek-samping/lapor';
    final String apiUrl =
        'http://sentra-vaksin.herokuapp.com/api/efek-samping/lapor';

    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode({
          "nama": efekSamping.nama,
          "nik": efekSamping.nik,
          "no_hp": efekSamping.no_hp,
          "alamat": efekSamping.alamat,
          "vaksin": efekSamping.vaksin,
          "gejala": efekSamping.gejala,
          "token": efekSamping.token,
        }));

    if (response.statusCode == 201) {
      return "Laporan telah diterima";
    } else if (response.statusCode == 400) {
      return "Token salah, laporan gagal dibuat";
    } else {
      return "Ada masalah dalam pengiriman data, mohon coba beberapa saat lagi";
    }
  }

  Widget buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)))),
      onPressed: () async {
        final isValid = _formKey.currentState!.validate();
        if (isValid) {
          _formKey.currentState!.save();
          EfekSamping efekSamping = EfekSamping(
              nama!, nik!, no_hp!, alamat!, vaksin!, gejala!, token!);
          final String hasilLaporan = await createLaporan(efekSamping);

          setState(() {
            hasil = hasilLaporan;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(hasil!)),
          );

          if (hasil == "Laporan telah diterima") {
            _formKey.currentState!.reset();
          }
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
                      //style: Theme.of(context).textTheme.headline2,
                    )),
                SizedBox(
                  height: 30,
                ),
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