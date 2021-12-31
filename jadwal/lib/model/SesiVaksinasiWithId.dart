// To parse this JSON data, do
//
//     final sesiVaksinasi = sesiVaksinasiFromJson(jsonString);

import 'dart:convert';

List<SesiVaksinasiWithId> sesiVaksinasiWithIdFromJson(String str) =>
    List<SesiVaksinasiWithId>.from(
        json.decode(str).map((x) => SesiVaksinasiWithId.fromJson(x)));

String sesiVaksinasiWithIdToJson(List<SesiVaksinasiWithId> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SesiVaksinasiWithId {
  SesiVaksinasiWithId({
    this.id = "",
    this.waktu = "",
    this.tempatPelaksanaan = "",
    this.jenisVaksin = "",
    this.kuota = 0,
    this.kontak = "",
  });

  String id;
  String waktu;
  String tempatPelaksanaan;
  String jenisVaksin;
  int kuota;
  String kontak;

  factory SesiVaksinasiWithId.fromJson(Map<String, dynamic> json) =>
      SesiVaksinasiWithId(
        id: json["id"],
        waktu: json["waktu"],
        tempatPelaksanaan: json["tempat_pelaksanaan"],
        jenisVaksin: json["jenis_vaksin"],
        kuota: json["kuota"],
        kontak: json["kontak"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "waktu": waktu,
        "tempat_pelaksanaan": tempatPelaksanaan,
        "jenis_vaksin": jenisVaksin,
        "kuota": kuota,
        "kontak": kontak,
      };
}
