import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';
import 'package:task/models/passenger.dart';
import 'package:task/pages/paymentConfirmation.dart';
import 'package:task/widgets/contactDetails.dart';
import 'package:task/widgets/flightAmenities.dart';
import 'package:task/widgets/flightCard2.dart';
import 'package:task/widgets/passengerDetails.dart';
import 'package:task/widgets/seatNumber.dart';

class FlightBookingScreen extends StatefulWidget {
  final Flight flight;
  final int passengers;

  const FlightBookingScreen({super.key, required this.flight, required this.passengers});

  @override
  State<FlightBookingScreen> createState() => FlightBookingScreenState();
}

class FlightBookingScreenState extends State<FlightBookingScreen> {
  int? selectedSeat;

  Passenger passenger = Passenger(
    name: "",
    contactNo: "",
    email: "",
  );

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
                    FlightCard2(flight: widget.flight),

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

                            Divider(
                              thickness: 1,
                              color: Colors.grey,
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

                    PassengerDetails(
                      onPassengerChanged: (updatedPassenger) {
                        passenger = updatedPassenger;
                      },
                    ),

                    SizedBox(height: 20),

                    SeatNumber(
                      onSeatSelected: (seat) {
                        setState(() {
                          selectedSeat = seat;
                        });
                      },
                    ),

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
                                    Text("${widget.flight.airline} (Adult) x${widget.passengers}"),

                                    Text("\$${widget.flight.price * widget.passengers}"),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Travel Insurance"),

                                    Text("\$45.0"),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [Text("Tax"), Text("\$25.0")],
                                ),

                                SizedBox(height: 30),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Price"),

                                    Text("\$${(widget.flight.price * widget.passengers)}"),
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
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey)
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  )
                ),
                onPressed: () {
                  if (passenger.name == "" || passenger.email == "" || passenger.contactNo == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter all your credentials."))
                    );

                    return;
                  }
                  
                  if (selectedSeat == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select a seat number."))
                    );

                    return;
                  }

                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => PaymentConfirmation(
                        flight: widget.flight,
                        passenger: passenger,
                        seat: selectedSeat,
                        passengers: widget.passengers,
                      )
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
