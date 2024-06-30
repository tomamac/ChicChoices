class Ticket {
  String from;
  String to;
  String date;
  int travelers;
  String bookingClass;
  String time;
  String duration;
  String flightNumber;
  List<String> seats;
  int price;
  String gateNumber;

  Ticket({
    required this.from,
    required this.to,
    required this.date,
    required this.travelers,
    required this.bookingClass,
    required this.time,
    required this.duration,
    required this.flightNumber,
    required this.seats,
    required this.price,
    required this.gateNumber,
  });
}
