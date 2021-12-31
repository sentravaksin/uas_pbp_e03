// To parse this JSON data, do
//
//     final sesiVaksinasi = sesiVaksinasiFromJson(jsonString);

import 'dart:convert';

List<SesiVaksinasi> sesiVaksinasiFromJson(String str) =>
    List<SesiVaksinasi>.from(
        json.decode(str).map((x) => SesiVaksinasi.fromJson(x)));

String sesiVaksinasiToJson(List<SesiVaksinasi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SesiVaksinasi {
  SesiVaksinasi({
    this.waktu = "",
    this.tempatPelaksanaan = "",
    this.jenisVaksin = "",
    this.kuota = 0,
    this.kontak = "",
  });

  String waktu;
  String tempatPelaksanaan;
  String jenisVaksin;
  int kuota;
  String kontak;

  factory SesiVaksinasi.fromJson(Map<String, dynamic> json) => SesiVaksinasi(
        waktu: json["waktu"],
        tempatPelaksanaan: json["tempat_pelaksanaan"],
        jenisVaksin: json["jenis_vaksin"],
        kuota: json["kuota"],
        kontak: json["kontak"],
      );

  Map<String, dynamic> toJson() => {
        "waktu": waktu,
        "tempat_pelaksanaan": tempatPelaksanaan,
        "jenis_vaksin": jenisVaksin,
        "kuota": kuota,
        "kontak": kontak,
      };
}
