import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';
import 'package:task/models/passenger.dart';
import 'package:intl/intl.dart';

class TicketScreen extends StatelessWidget {
  final Flight flight;
  final Passenger passenger;
  final int? seat;
  final String bookingID;

  const TicketScreen({
    super.key,
    required this.flight,
    required this.passenger,
    required this.seat,
    required this.bookingID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-ticket"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // barcode
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          height: 120,
                          width: double.infinity,
                          child: Center(
                            child: Image.asset(
                              "assets/images/ticket_barcode.jpg",
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),

                      Text(
                        "Show your ID and this barcode at the check-in gate.",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),

                      Divider(
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Booking ID",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            bookingID,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Divider(
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),

                      SizedBox(height: 10,),

                      Text(
                        "Flight Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Flight No.",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            flight.flightNo,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Airline",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            flight.airline,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Departure",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            flight.from + " (${flight.departureAirport})",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Destination",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            flight.to + " (${flight.arrivalAirport})",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Departure Date",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            DateFormat("E, dd MMM yyy").format(flight.flightDate),
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Estimated Departure Time",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            flight.departureTime,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Estimated Arrival Time",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            flight.arrivalTime,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      Text(
                        "Passenger Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Passenger name",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            passenger.name,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email", style: TextStyle(color: Colors.black)),
                          Text(
                            passenger.email,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone no.",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            passenger.contactNo,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Seat no.",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            seat.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Divider(
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),

                      Text("Thank you for flying with us!", style: TextStyle(color: Colors.black)),

                      Text("\u00A9 ${flight.airline}", style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),

              ElevatedButton(
                onPressed: () {}, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload),

                    Text("Share")
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  elevation: 5,
                  fixedSize: Size(120, 40)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
