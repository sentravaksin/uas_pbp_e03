// page confirm setelah berhasil registrasi
import 'package:belum_vaksin/screens/peserta_vaksin.dart';
import 'package:efek_samping/lapor.dart';
import 'package:daftar_nakes/daftar_nakes.dart';
import 'package:flutter/material.dart';
import 'package:belum_vaksin/belum_vaksin.dart';
import 'package:belum_vaksin/screens/registrasi_vaksin.dart';

import '../widgets/text_widgets.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({
    Key? key,
    /*PesertaVaksin? pesertaVaksin*/
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // color system
    var offWhite = Color.fromARGB(255, 255, 248, 250);
    var pinkAccent = Color.fromARGB(255, 255, 144, 181);
    var fontColor = Color.fromARGB(255, 156, 54, 88);

    // for navigation TODO: UPDATE INI
    void onSelected(BuildContext context, int item) {
      print('masuk');
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
              context, MaterialPageRoute(builder: (context) => Daftar_Nakes()));
          break;
        default:
      }
    }

    // hardcode
    PesertaVaksin pesertaDummy = PesertaVaksin(
        "31-12-21", "jakarta", "booster", "demo", "1234567890", "081209876543");

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Registrasi Vaksin Berhasil!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: fontColor,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  decoration: BoxDecoration(
                    color: offWhite,
                    border: Border.all(color: pinkAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Pendaftaran vaksinasi atas nama " +
                            pesertaDummy.nama_peserta +
                            " berhasil dibuat.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: fontColor),
                      ),
                      SizedBox(height: 28),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Detail Peserta",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: fontColor,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CustomText("Nama"),
                                  CustomText("NIK"),
                                  CustomText("No. Telepon"),
                                ],
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CustomText(": " + pesertaDummy.nama_peserta),
                                  CustomText(
                                      ": " + pesertaDummy.nik.toString()),
                                  CustomText(
                                      ": " + pesertaDummy.no_telp.toString()),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Detail Vaksinasi",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: fontColor,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CustomText("Tanggal"),
                                  CustomText("Lokasi"),
                                  CustomText("Jenis Vaksin"),
                                ],
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CustomText(": " + pesertaDummy.waktu),
                                  CustomText(
                                      ": " + pesertaDummy.tempat_pelaksanaan),
                                  CustomText(": " + pesertaDummy.jenis_vaksin),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 28),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: fontColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 36, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Lihat Daftar Peserta Vaksin",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DaftarPesertaVaksin()),
                          );
                        },
                      ),
                      SizedBox(height: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: pinkAccent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 36, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Kembali",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          // Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrasiVaksin()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // bottom navbar
      // TODO: UPDATE INI
      bottomNavigationBar: BottomNavigationBar(
        onTap: (item) => onSelected(context, item),
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
