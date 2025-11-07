import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';
import 'package:task/pages/flightDetails.dart';
import 'package:task/widgets/flight_card.dart';
import 'package:intl/intl.dart';

class FlightsPage extends StatelessWidget {
  final String tripType;
  final String from;
  final String to;
  final DateTime departureDate;
  final int passengers;
  final String flightClass;

  const FlightsPage({
    super.key,
    required this.tripType,
    required this.from,
    required this.to,
    required this.departureDate,
    required this.passengers,
    required this.flightClass,
  });

  @override
  Widget build(BuildContext context) {
    final List<Flight> flights = [
      Flight(
        airline: "Biman Bangladesh",
        from: "Dhaka",
        to: "New York",
        departureAirport: "DAC",
        arrivalAirport: "NYC",
        flightDate: DateTime(2025, 12, 10),
        departureTime: "08:00",
        arrivalTime: "12:00",
        flightClass: "Economy",
        price: 1250.0,
        airlineLogoPath: "assets/images/biman_bangladesh.png",
        flightDuration: "12h 45m",
        flightNo: "BG400",
      ),
      Flight(
        airline: "Emirates",
        from: "Dhaka",
        to: "New York",
        departureAirport: "DAC",
        arrivalAirport: "NYC",
        flightDate: DateTime(2025, 12, 10),
        departureTime: "12:00",
        arrivalTime: "01:00",
        flightClass: "Business",
        price: 1400.0,
        airlineLogoPath: "assets/images/emirates.png",
        flightDuration: "16h 00m",
        flightNo: "UAE116",
      ),
      Flight(
        airline: "Qatar Airways",
        from: "Dhaka",
        to: "New York",
        departureAirport: "DAC",
        arrivalAirport: "NYC",
        flightDate: DateTime(2025, 12, 10),
        departureTime: "09:00",
        arrivalTime: "23:00",
        flightClass: "Economy",
        price: 1350.0,
        airlineLogoPath: "assets/images/qatar_airways.png",
        flightDuration: "14h 00m",
        flightNo: "QA213",
      ),
      Flight(
        airline: "British Airways",
        from: "Dhaka",
        to: "New York",
        departureAirport: "DAC",
        arrivalAirport: "NYC",
        flightDate: DateTime(2025, 12, 10),
        departureTime: "20:00",
        arrivalTime: "12:00",
        flightClass: "Economy",
        price: 1320.0,
        airlineLogoPath: "assets/images/british_airways.jpg",
        flightDuration: "13h 30m",
        flightNo: "BA78",
      ),
      Flight(
        airline: "Singapore Airlines",
        from: "Dhaka",
        to: "New York",
        departureAirport: "DAC",
        arrivalAirport: "NYC",
        flightDate: DateTime(2025, 12, 10),
        departureTime: "02:00",
        arrivalTime: "15:00",
        flightClass: "Economy",
        price: 1500.0,
        airlineLogoPath: "assets/images/singapore_airlines.png",
        flightDuration: "14h 10m",
        flightNo: "SIN504",
      ),
      Flight(
        airline: "Turkish Airlines",
        from: "Dhaka",
        to: "New York",
        departureAirport: "DAC",
        arrivalAirport: "NYC",
        flightDate: DateTime(2025, 12, 10),
        departureTime: "05:00",
        arrivalTime: "15:00",
        flightClass: "Economy",
        price: 1100.0,
        airlineLogoPath: "assets/images/turkish_airlines.png",
        flightDuration: "12h 15m",
        flightNo: "TIL1054",
      ),
    ];

    final filteredFlights = flights
        .where(
          (flight) =>
              from.contains(flight.from) &&
              to.contains(flight.to) &&
              flight.flightDate == departureDate &&
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
                  DateFormat("dd MMM, yyyy").format(departureDate),
                  style: TextStyle(color: Colors.blue),
                ),
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all<double>(5.0),
                ),
              ),

              SizedBox(height: 2),

              Expanded(
                child: filteredFlights.isEmpty
                    ? Center(
                        child: Text(
                          "No available flights for chosen date.",
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredFlights.length,
                        itemBuilder: (context, index) {
                          final flight = filteredFlights[index];

                          return FlightCard(
                            flight: flight,
                            passengers: passengers,

                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FlightDetails(
                                    flight: flight,
                                    passengers: passengers,
                                  ),
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
