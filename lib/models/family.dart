class Family {
  int idUser, id;
  String name, nik, usia, telp, gender;

  Family({
    required this.idUser,
    required this.id,
    required this.name,
    required this.nik,
    required this.usia,
    required this.telp,
    required this.gender,
  });

  Map toJson() => {
        'fullname': name,
        'nik': nik,
        'usia': usia,
        'user_id': idUser,
        'gender': gender,
        'phone': telp,
        'isParent': false
      };
}
