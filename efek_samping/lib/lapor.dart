import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'EfekSamping.dart';
import 'dart:convert';
import 'package:daftar_nakes/daftar_nakes.dart';
import 'package:jadwal/jadwal.dart';
import 'package:belum_vaksin/belum_vaksin.dart';

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
          labelStyle: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
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
          labelStyle: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
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
          labelStyle: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
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
          labelStyle: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
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
          labelStyle: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
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
          labelStyle: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
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
          labelStyle: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
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
                side: BorderSide(color: Colors.blue))),
      ),
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
            SnackBar(
                content: Text(hasil!,
                    style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'))),
          );

          if (hasil == "Laporan telah diterima") {
            _formKey.currentState!.reset();
          }
        }
      },
      child: Text(
        "Submit",
        style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Daftar_Nakes()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Daftar_Nakes()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Laporan Efek Samping Vaksin",
            style: TextStyle(fontFamily: 'ABeeZee', fontSize: 24)),
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "Jadwal Vaksin",
                    style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
                  )),
              PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    "Registrasi Vaksin",
                    style: TextStyle(fontSize: 20, fontFamily: 'ABeeZee'),
                  )),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
    );
  }
}
