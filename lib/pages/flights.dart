import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';
import 'package:task/pages/flightDetails.dart';
import 'package:task/widgets/flight_card.dart';

class FlightsPage extends StatelessWidget {
  final String trip;
  final String from;
  final String to;
  final DateTime date;
  final int passengers;
  final String flightClass;

  const FlightsPage({
    super.key,
    required this.trip,
    required this.from,
    required this.to,
    required this.date,
    required this.passengers,
    required this.flightClass,
  });

  @override
  Widget build(BuildContext context) {
    final List<Flight> flights = [
      Flight(
        airline: "Biman Bangladesh",
        from: "Dhaka (DAC)",
        to: "New York (JFK)",
        date: DateTime(2025, 12, 10),
        departureTime: "08:00",
        arrivalTime: "12:00",
        flightClass: "Economy",
        price: 1250.0,
        airlineLogoPath: "assets/images/biman_bangladesh.png",
      ),
      Flight(
        airline: "Emirates",
        from: "Dhaka (DAC)",
        to: "New York (JFK)",
        date: DateTime(2025, 12, 10),
        departureTime: "12:00",
        arrivalTime: "01:00",
        flightClass: "Business",
        price: 1400.0,
        airlineLogoPath: "assets/images/emirates.png",
      ),
      Flight(
        airline: "Qatar Airways",
        from: "Dhaka (DAC)",
        to: "New York (JFK)",
        date: DateTime(2025, 12, 10),
        departureTime: "09:00",
        arrivalTime: "23:00",
        flightClass: "Economy",
        price: 1350.0,
        airlineLogoPath: "assets/images/qatar_airways.png",
      ),
      Flight(
        airline: "British Airways",
        from: "Dhaka (DAC)",
        to: "New York (JFK)",
        date: DateTime(2025, 12, 10),
        departureTime: "20:00",
        arrivalTime: "12:00",
        flightClass: "Economy",
        price: 1320.0,
        airlineLogoPath: "assets/images/british_airways.jpg",
      ),
      Flight(
        airline: "Singapore Airlines",
        from: "Dhaka (DAC)",
        to: "New York (JFK)",
        date: DateTime(2025, 12, 10),
        departureTime: "02:00",
        arrivalTime: "15:00",
        flightClass: "Economy",
        price: 1500.0,
        airlineLogoPath: "assets/images/singapore_airlines.png",
      ),
      Flight(
        airline: "Turkish Airlines",
        from: "Dhaka (DAC)",
        to: "New York (JFK)",
        date: DateTime(2025, 12, 10),
        departureTime: "05:00",
        arrivalTime: "15:00",
        flightClass: "Economy",
        price: 1100.0,
        airlineLogoPath: "assets/images/turkish_airlines.png",
      ),
    ];

    final filteredFlights = flights
        .where(
          (flight) =>
              flight.from == from &&
              flight.to == to &&
              flight.date == date &&
              flight.flightClass == flightClass,
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Search Flights"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Icon(Icons.menu),
          Padding(padding: EdgeInsets.all(5)),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {}, 
                child: Text(
                  date.toString(),
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all<double>(5.0),
                )
              ),

              SizedBox(height: 2),

              Expanded(
                child: ListView.builder(
                  itemCount: filteredFlights.length,
                  itemBuilder: (context, index) {
                    final flight = filteredFlights[index];

                    return FlightCard(
                      flight: flight,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FlightDetails(flight: flight),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
