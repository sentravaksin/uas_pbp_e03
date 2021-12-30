// mendefinisikan object PesertaVaksin
// mirip models(?)

class PesertaVaksin {
  // field attributes
  var waktu;
  String tempat_pelaksanaan;
  String jenis_vaksin;
  String nama_peserta;
  int nik;
  int no_telp;

  // generated attributes (masih ga ngerti nanti gmn)
  // var id;
  // var sesi;
  // var token;

  // constructor
  PesertaVaksin(
    this.waktu,
    this.tempat_pelaksanaan,
    this.jenis_vaksin,
    this.nama_peserta,
    this.nik,
    this.no_telp,

    // this.id,
    // this.sesi,
    // this.token,
  );
}