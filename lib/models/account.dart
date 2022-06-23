class Account {
  int idUser, id;
  String name, email, password, nik, usia, telp, gender, photo;
  DateTime createdAt;
  bool isParent;

  Account(
      {required this.id,
      required this.idUser,
      required this.name,
      required this.email,
      required this.password,
      required this.nik,
      required this.usia,
      required this.telp,
      required this.gender,
      required this.photo,
      required this.isParent,
      required this.createdAt});

  Map toJson() => {
        'USERS_PERMISSIONS_USER': idUser,
        'fullname': name,
        'nik': nik,
        'usia': usia,
        'gender': gender,
        'phone': telp,
        'isParent': isParent
      };

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'nik': nik,
      'usia': usia,
      'gender': gender,
      'photo': photo,
      'telp': telp,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
