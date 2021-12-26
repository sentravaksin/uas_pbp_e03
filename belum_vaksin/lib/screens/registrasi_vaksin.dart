// page form registrasi vaksin
import 'package:flutter/material.dart';
import 'package:belum_vaksin/belum_vaksin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:daftar_nakes/daftar_nakes.dart';

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
  int? nik;
  int? no_telp;
  var id;
  var sesi;
  var token;

  // for form result
  String _submit = "";
  void _updateSubmit(String submitted) {
    setState(() {
      _submit = submitted;
    });
  }

  // color system
  var pinkAccent = Color.fromARGB(255, 255, 144, 181);
  var fontColor = Color.fromARGB(255, 156, 54, 88);

  // for navigation TODO: UPDATE INI
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
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Daftar_Nakes()));
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
          )
        ),
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
          )
        ),
      ),
      maxLength: 100,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onChanged: (value) {
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
          )
        ),
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
          )
        ),
      ),
      maxLength: 16,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onChanged: (value) {
        nik = int.parse(value);
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
          )
        ),
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
          )
        ),
      ),
      maxLength: 15,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onChanged: (value) {
        no_telp = int.parse(value);
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
          )
        ),
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
          )
        ),
      ),
      maxLength: 100,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onChanged: (value) {
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
          )
        ),
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
          )
        ),
      ),
      maxLength: 100,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onChanged: (value) {
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
          )
        ),
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
          )
        ),
      ),
      maxLength: 100,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data ini wajib diisi!';
        }
        return null;
      },
      onChanged: (value) {
        jenis_vaksin = value;
        print("jenis vaksin: " + jenis_vaksin.toString()); // DEBUG
      },
    );
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
              PopupMenuItem<int>(value: 0, child: Text("Daftar Nakes")),
              PopupMenuItem<int>(value: 1, child: Text("Jadwal")),
              PopupMenuItem<int>(value: 2, child: Text("Belum Vaksin"))
            ],
          )
        ],
      ),

      // body
      // TODO: IMPLEMENT BODY
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Title(
                    color: Colors.blue,
                    child: Text(
                      "Registrasi Vaksin",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: fontColor,
                      ),
                    )),
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
              ],
            ),
          ),
        ),
      ),

      // bottom navbar
      // TODO: UPDATE INI
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