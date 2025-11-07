import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';
import 'package:task/pages/flightBookingScreen.dart';
import 'package:task/widgets/flightAmenities.dart';
import 'package:task/widgets/flightCard2.dart';

class FlightDetails extends StatelessWidget {
  final Flight flight;
  final int passengers;

  const FlightDetails({
    super.key,
    required this.flight,
    required this.passengers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flight Details"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Icon(Icons.bookmark_border),
          SizedBox(width: 5),
          Icon(Icons.share),
        ],
        actionsPadding: EdgeInsetsGeometry.all(10),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(30),
            child: Column(
              children: [
                // Flight Card
                FlightCard2(flight: flight),

                SizedBox(height: 10),

                // Amenities Card
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.airplane_ticket, size: 50),

                            SizedBox(width: 5),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Original",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),

                                Row(
                                  children: [
                                    Text(
                                      "\$" + flight.price.toString() + "/",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                    ),

                                    Icon(Icons.person),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        Divider(thickness: 1, color: Colors.grey),

                        SizedBox(height: 20),

                        // Flight Amenities list widget
                        FlightAmenities(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom button container
          Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 1)),
            ),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total price x${passengers}"),

                      Text(
                        "\$${(flight.price * passengers.toDouble()).toString()}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),

                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(Size(250, 20)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue,
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FlightBookingScreen(flight: flight, passengers: passengers,),
                        ),
                      );
                    },
                    child: Text("Continue"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
