class Ticket {
  int idBooking, idKelompok, idRumahSakit, idSession;
  String namaRumahSakit,
      alamatRumahSakit,
      kotaRumahSakit,
      nik,
      namaPasien,
      start,
      end,
      namaVaksin;

  DateTime dateSession;

  Ticket(
      {required this.idBooking,
      required this.idKelompok,
      required this.idRumahSakit,
      required this.idSession,
      required this.namaRumahSakit,
      required this.alamatRumahSakit,
      required this.kotaRumahSakit,
      required this.nik,
      required this.namaPasien,
      required this.dateSession,
      required this.start,
      required this.end,
      required this.namaVaksin});

  Map toJson() => {"id_kelompok": idKelompok, "id_session": idSession};
}
