import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';
import 'package:intl/intl.dart';

class FlightCard2 extends StatelessWidget {
  final Flight flight;

  const FlightCard2({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 18),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    // Image.asset(
                    //   flight!.airlineLogoPath,
                    //   width: 50,
                    //   height: 50,
                    // ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(flight!.airlineLogoPath),
                    ),
                    Text(
                      flight!.airline,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          DateFormat("E, MMM d yyyy").format(flight.date),
                          style: TextStyle(
                            fontSize: 11
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Divider(thickness: 2),

            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(flight!.from, style: TextStyle(fontSize: 15)),
                    Text(flight!.departureTime, style: TextStyle(fontSize: 15)),
                  ],
                ),

                Container(
                  child: Column(
                    children: [
                      // Image.asset(
                      //   "assets/images/flight_card_img.png",
                      //   width: 50,
                      //   height: 50,
                      // ),
                      Text("time"),
                      Text("Direct"),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Text(flight!.to, style: TextStyle(fontSize: 15)),
                    Text(flight!.arrivalTime, style: TextStyle(fontSize: 15)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
