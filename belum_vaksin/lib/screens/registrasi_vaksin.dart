// page form registrasi vaksin
import 'package:efek_samping/lapor.dart';
import 'package:flutter/material.dart';
import 'package:belum_vaksin/belum_vaksin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:daftar_nakes/daftar_nakes.dart';

import 'confirm_registrasi.dart';

class RegistrasiVaksin extends StatefulWidget {
  const RegistrasiVaksin({Key? key}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<RegistrasiVaksin> {
  // form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // attibutes for submission
  var waktu;
  String? tempat_pelaksanaan;
  String? jenis_vaksin;
  String? nama_peserta;
  String? nik;
  String? no_telp;
  var id;
  var sesi;
  var token;

  // for form result
  String _submit = "";

  // color system
  var pinkAccent = Color.fromARGB(255, 255, 144, 181);
  var fontColor = Color.fromARGB(255, 156, 54, 88);

  // for navigation TODO: UPDATE INI
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lapor()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lapor()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lapor()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lapor()));
        break;
      default:
    }
  }

  // field widgets
  Widget NamaField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(
          "Nama",
          style: TextStyle(
            color: fontColor,
          ),
        ),
        hintText: "masukkan nama Anda",
        hintStyle: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 139, 139, 139),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: pinkAccent,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
      maxLength: 100,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onSaved: (value) {
        nama_peserta = value;
        print("nama peserta: " + nama_peserta.toString()); // DEBUG
      },
    );
  }

  Widget NIKField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(
          "NIK",
          style: TextStyle(
            color: fontColor,
          ),
        ),
        hintText: "masukkan NIK Anda",
        hintStyle: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 139, 139, 139),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: pinkAccent,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
      maxLength: 16,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onSaved: (value) {
        nik = value;
        print("nik: " + nik.toString()); // DEBUG
      },
    );
  }

  Widget NoTelpField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(
          "No Telpon",
          style: TextStyle(
            color: fontColor,
          ),
        ),
        hintText: "masukkan nomor telpon Anda",
        hintStyle: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 139, 139, 139),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: pinkAccent,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
      maxLength: 15,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onSaved: (value) {
        no_telp = value;
        print("no telp: " + no_telp.toString()); // DEBUG
      },
    );
  }

  Widget TanggalField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(
          "Tanggal",
          style: TextStyle(
            color: fontColor,
          ),
        ),
        hintText: "pilih tanggal vaksinasi",
        hintStyle: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 139, 139, 139),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: pinkAccent,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
      maxLength: 100,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onSaved: (value) {
        waktu = value;
        print("waktu: " + waktu.toString()); // DEBUG
      },
    );
  }

  Widget LokasiField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(
          "Lokasi",
          style: TextStyle(
            color: fontColor,
          ),
        ),
        hintText: "masukkan lokasi vaksinasi",
        hintStyle: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 139, 139, 139),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: pinkAccent,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
      maxLength: 100,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onSaved: (value) {
        tempat_pelaksanaan = value;
        print("tempat pelaksanaan: " + tempat_pelaksanaan.toString()); // DEBUG
      },
    );
  }

  Widget JenisVaksinField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(
          "JenisVaksin",
          style: TextStyle(
            color: fontColor,
          ),
        ),
        hintText: "masukkan jenis vaksin untuk vaksinasi Anda",
        hintStyle: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 139, 139, 139),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: pinkAccent,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
      maxLength: 100,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onSaved: (value) {
        jenis_vaksin = value;
        print("jenis vaksin: " + jenis_vaksin.toString()); // DEBUG
      },
    );
  }

  // submit button widget
  Widget SubmitRegistrasi(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: pinkAccent,
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        textStyle: TextStyle(
          fontSize: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        "Submit",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      onPressed: () async {
        final valid = _formKey.currentState!.validate();

        if (valid) {
          _formKey.currentState!.save();

          PesertaVaksin pesertaVaksin = PesertaVaksin(
            waktu!, tempat_pelaksanaan!, jenis_vaksin!, nama_peserta!, nik!,
            no_telp!,
            // id, sesi, token belom ngerti harus gimana
          );
          final String finalSubmit = await registerPeserta(pesertaVaksin);

          setState(() {
            _submit = finalSubmit;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(_submit,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'ABeeZee',
                      color: fontColor,
                    ))),
          );

          if (_submit == "Laporan telah diterima") {
            _formKey.currentState!.reset();
          }
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConfirmPage()),
        );
      },
    );
  }

  // for creating the registration
  Future<String> registerPeserta(PesertaVaksin pesertaVaksin) async {
    final String apiUrl =
        'http://sentra-vaksin.herokuapp.com/api/belum_vaksin/create/';

    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Access-Control_Allow_Origin": "*",
          "Content-Type": "application/json; charset=utf-8",
        },
        body: jsonEncode({
          "waktu": pesertaVaksin.waktu,
          "tempat_pelaksanaan": pesertaVaksin.tempat_pelaksanaan,
          "jenis_vaksin": pesertaVaksin.jenis_vaksin,
          "nama_peserta": pesertaVaksin.nama_peserta,
          "nik": pesertaVaksin.nik,
          "no_telp": pesertaVaksin.no_telp,
          // id, sesi, token belom ngerti harus gimana
        }));

    if (response.statusCode == 201) {
      print("statusCode: " + response.statusCode.toString()); // DEBUG
      return "Laporan telah diterima";
    } else if (response.statusCode == 400) {
      print("statusCode: " + response.statusCode.toString() + "\n"); // DEBUG
      print(response.body + "\n"); // DEBUG
      print(response.reasonPhrase); // DEBUG
      return "Ada masalah dalam memasukkan data, mohon periksa kembali";
    } else {
      print("statusCode: " + response.statusCode.toString() + "\n"); // DEBUG
      print(response.body); // DEBUG
      return "Ada masalah dalam pengiriman data, mohon coba beberapa saat lagi";
    }
  }

  // widget build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        title: Text("Sentra Vaksin"),
        backgroundColor: pinkAccent,
        actions: [
          // TODO: UPDATE INI
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "Jadwal Vaksin",
                    style: TextStyle(fontSize: 20),
                  )),
              PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    "Peserta Vaksin",
                    style: TextStyle(fontSize: 20),
                  )),
              PopupMenuItem<int>(
                  value: 2,
                  child: Text(
                    "Lapor Efek Samping",
                    style: TextStyle(fontSize: 20),
                  )),
              PopupMenuItem<int>(
                  value: 3,
                  child: Text(
                    "Daftar Nakes",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          )
        ],
      ),

      // body
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Registrasi Vaksin",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: fontColor,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  NamaField(context),
                  SizedBox(
                    height: 12,
                  ),
                  NIKField(context),
                  SizedBox(
                    height: 12,
                  ),
                  NoTelpField(context),
                  SizedBox(
                    height: 12,
                  ),
                  TanggalField(context),
                  SizedBox(
                    height: 12,
                  ),
                  LokasiField(context),
                  SizedBox(
                    height: 12,
                  ),
                  JenisVaksinField(context),
                  SizedBox(
                    height: 8,
                  ),
                  SubmitRegistrasi(context),
                ],
              ),
            ),
          ),
        ),
      ),

      // bottom navbar
      // TODO: UPDATE INI
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color.fromARGB(255, 105, 105, 105),
        selectedItemColor: pinkAccent,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: 'Jadwal Vaksin',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind_outlined),
            label: 'Peserta Vaksin',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_comment_outlined),
            label: 'Lapor',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.badge_outlined),
            label: 'Daftar Nakes',
          ),
        ],
      ),
    );
  }
}
