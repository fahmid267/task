import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';
import 'package:task/models/passenger.dart';

class TicketScreen extends StatelessWidget {
  final Flight flight;
  final Passenger passenger;
  final int? seat;
  final String bookingID;

  const TicketScreen({super.key, required this.flight, required this.passenger, required this.seat, required this.bookingID});

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
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Booking ID"),
                      Text(
                        bookingID,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 10,),

                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey,
                  ),

                  Text(
                    "Flight Information",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Expanded(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Flight No."),
                      Text("BG")
                    ],
                  ),
                  ),
                  
                  Expanded(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Arrival"),
                      Text(flight.from)
                    ],
                  ),
                  ),
                  
                  Expanded(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Destination"),
                      Text(flight.to)
                    ],
                  ),
                  ),
                  
                  Expanded(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Estimated Departure Time"),
                      Text(flight.departureTime)
                    ],
                  ),
                  ),
                  
                  Expanded(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Estimated Arrival Time"),
                      Text(flight.arrivalTime)
                    ],
                  ),
                  ),

                  SizedBox(height: 10,),

                  Text(
                    "Passenger Information",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Expanded(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Passenger name"),
                      Text(passenger.name)
                    ],
                  ),
                  ),
                  
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email"),
                        Text(passenger.email)
                      ],
                    ),
                  ),
                  
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Phone no."),
                        Text(passenger.contactNo)
                      ],
                    ),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Seat no."),
                      Text(seat.toString())
                    ],
                  ),

                  SizedBox(height: 10,),

                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}