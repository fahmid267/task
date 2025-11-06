class Flight {
  final String airline;
  final String from;
  final String to;
  final DateTime date;
  final String departureTime;
  final String arrivalTime;
  final String flightClass;
  final double price;
  final String airlineLogoPath;
  final String duration;
  final String flightNo;

  Flight({
    required this.airline,
    required this.from,
    required this.to,
    required this.date,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightClass,
    required this.price,
    required this.airlineLogoPath,
    required this.duration,
    required this.flightNo
  });
}