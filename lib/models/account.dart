class Account {
  String idUser, name, email, password, nik, usia, telp, gender, photo;
  DateTime createdAt;

  Account(
      {required this.idUser,
      required this.name,
      required this.email,
      required this.password,
      required this.createdAt,
      required this.nik,
      required this.usia,
      required this.telp,
      required this.gender,
      required this.photo});

  Map toJson() => {
        'name': name,
        'email': email.toLowerCase(),
        'password': password,
        'nik': nik,
        'usia': usia,
        'gender': gender,
        'photo': photo,
        'telp': telp,
        'createdAt': createdAt.toIso8601String(),
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
