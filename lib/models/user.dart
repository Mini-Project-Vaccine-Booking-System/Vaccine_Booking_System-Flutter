class User {
  int id;
  String email, password, nik, phone, nama, gender, image;
  DateTime tanggalLahir;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.nik,
      required this.phone,
      required this.nama,
      required this.gender,
      required this.tanggalLahir,
      required this.image});

  Map toJson() => {
        "email": email,
        "username": "",
        "password": password,
        "role": "user",
        "nik": nik,
        "noHp": phone,
        "nama": nama,
        "gender": gender,
        "image": image,
        "address": "",
        "kota": "",
        "tglLahir": tanggalLahir.toIso8601String(),
      };
}
