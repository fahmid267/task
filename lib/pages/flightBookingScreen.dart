import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';
import 'package:task/models/passenger.dart';
import 'package:task/pages/paymentConfirmation.dart';
import 'package:task/widgets/contactDetails.dart';
import 'package:task/widgets/flightAmenities.dart';
import 'package:task/widgets/flightCard2.dart';
import 'package:task/widgets/passengerDetails.dart';
import 'package:task/widgets/seatNumber.dart';

class FlightBookingScreen extends StatelessWidget {
  final Flight flight;

  final Passenger passenger = Passenger(
    name: "Fahmid",
    contactNo: "+8801728826321",
    email: "fahmid267@gmail.com",
    imagePath: "images/user_image.png"
  );

  FlightBookingScreen({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill In Details'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    // Flight Info Card
                    FlightCard2(flight: flight),

                    SizedBox(height: 10),

                    // Flight Ammenities
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Flight Ammenities",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 20),

                            // Flight ammenities list widget
                            FlightAmenities()
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // ContactDetails(),

                    // SizedBox(height: 20),

                    PassengerDetails(),

                    SizedBox(height: 20),

                    SeatNumber(),

                    SizedBox(height: 20),

                    // Price Details
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.currency_pound_outlined),

                                    SizedBox(width: 8),

                                    Text(
                                      "Price Details",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 15),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              spacing: 5,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${flight.airline} (Adult) x1"),

                                    Text(
                                      "\$" + flight.price.toString() + ".00",
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Travel Insurance"),

                                    Text("\$45.00"),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [Text("Tax"), Text("\$25.00")],
                                ),

                                SizedBox(height: 30),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Price"),

                                    Text(
                                      "\$" +
                                          (flight.price + 45.00 + 25.00)
                                              .toString() +
                                          ".00",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => PaymentConfirmation(flight: flight)
                    )
                  );
                },
                child: Text("Continue"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
