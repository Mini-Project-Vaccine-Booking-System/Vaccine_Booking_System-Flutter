class Session {
  int id, stock;
  String name, address, vaccine, start, end;
  DateTime date;

  Session(
      {required this.id,
      required this.name,
      required this.address,
      required this.start,
      required this.end,
      required this.vaccine,
      required this.stock,
      required this.date});
}