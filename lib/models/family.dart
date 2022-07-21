class Family {
  int id, idParent;
  String name, nik, telp, gender, hubungan, tanggalLahir;

  Family(
      {required this.id,
      required this.idParent,
      required this.name,
      required this.nik,
      required this.tanggalLahir,
      required this.telp,
      required this.gender,
      required this.hubungan});

  Map toJson() => {
        "id_user": idParent,
        "nik": nik,
        "tlp": telp,
        "nama_kelompok": name,
        "tgl_lahir": tanggalLahir,
        "hubungan": hubungan,
        "gender": gender
      };

  Map updateJson() => {
        "id": id,
        "id_user": idParent,
        "nik": nik,
        "noHp": telp,
        "nama": name,
        "tglLahir": tanggalLahir,
        "hubungan": hubungan,
        "gender": gender
      };
}
