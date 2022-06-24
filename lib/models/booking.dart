class Booking {
  int id, family_id, schedule_id, vaccine_id, hospital_id;
  String userName,
      userNik,
      userHospitalName,
      userHospitalAddress,
      userScheduleStart,
      userScheduleEnd,
      userVaccineName;

  Booking(
      {required this.id,
      required this.family_id,
      required this.schedule_id,
      required this.vaccine_id,
      required this.hospital_id,
      required this.userName,
      required this.userNik,
      required this.userHospitalName,
      required this.userHospitalAddress,
      required this.userScheduleStart,
      required this.userScheduleEnd,
      required this.userVaccineName});
}
