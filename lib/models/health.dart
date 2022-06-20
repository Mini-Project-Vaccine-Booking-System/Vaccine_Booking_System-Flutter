import 'dart:ffi';

class Health {
  String idHealth, address, city, name;
  bool schedule;

  Health(
      {required this.idHealth,
      required this.address,
      required this.city,
      required this.name,
      required this.schedule});
}
