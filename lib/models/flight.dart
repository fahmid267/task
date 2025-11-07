class Flight {
  final String airline;
  final String from;
  final String to;
  final String departureAirport;
  final String arrivalAirport;
  final DateTime flightDate;
  final String departureTime;
  final String arrivalTime;
  final String flightClass;
  final double price;
  final String airlineLogoPath;
  final String flightDuration;
  final String flightNo;

  Flight({
    required this.airline,
    required this.from,
    required this.to,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.flightDate,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightClass,
    required this.price,
    required this.airlineLogoPath,
    required this.flightDuration,
    required this.flightNo
  });
}