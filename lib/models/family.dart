class Family {
  String idUser, idFamily, name, nik, usia, telp, gender;
  DateTime createdAt;

  Family(
      {required this.idUser,
      required this.idFamily,
      required this.name,
      required this.createdAt,
      required this.nik,
      required this.usia,
      required this.telp,
      required this.gender,});

  Map toJson() => {
        'name': name,
        'nik': nik,
        'usia': usia,
        'idUser': idUser,
        'gender': gender,
        'telp': telp,
        'createdAt': createdAt.toIso8601String(),
      };
}
