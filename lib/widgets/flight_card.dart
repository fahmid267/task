import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';

class FlightCard extends StatelessWidget {
  final Flight? flight;
  final VoidCallback? onTap;

  const FlightCard({super.key, this.flight, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
                    ],
                  ),

                  Text(
                    "\$${flight!.price.toString()}/p",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
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
                      Text(
                        flight!.departureTime,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
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
                        Text(flight!.duration),
                        Text("Direct"),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      Text(flight!.to, style: TextStyle(fontSize: 15)),
                      Text(
                        flight!.arrivalTime, 
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
