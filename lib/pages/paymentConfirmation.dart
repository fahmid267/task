import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';
import 'package:task/models/passenger.dart';
import 'package:task/pages/ticketScreen.dart';
import 'package:task/widgets/flightCard2.dart';

class PaymentConfirmation extends StatefulWidget {
  final Flight flight;
  final Passenger passenger;
  final int? seat;
  final int passengers;

  PaymentConfirmation({
    super.key,
    required this.flight,
    required this.passenger,
    required this.seat,
    required this.passengers,
  });

  @override
  State<PaymentConfirmation> createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  final List<Map<String, double>> paymentMethods = [
    {"My Wallet": 2900.00},
    {"Card": 3000.00},
    {"Google Pay": 1000.00},
  ];

  final String bookingID = "BKD12739";

  Map<String, double>? selectedPayMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation'),
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
                    FlightCard2(flight: widget.flight),

                    SizedBox(height: 10),

                    // Payment Method
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
                                    Icon(Icons.credit_card),

                                    SizedBox(width: 8),

                                    Text(
                                      "Payment Method",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Divider(thickness: 1, color: Colors.grey),

                            SizedBox(height: 10),

                            DropdownButtonFormField<Map<String, double>>(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                labelText: "Select Payment Method",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              items: paymentMethods.map((paymentMethod) {
                                String method = paymentMethod.keys.first;
                                double amount = paymentMethod.values.first;

                                return DropdownMenuItem(
                                  value: paymentMethod,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(method),

                                      Text("\$${amount.toString()}"),
                                    ],
                                  ),
                                );
                              }).toList(),

                              selectedItemBuilder: (context) {
                                return paymentMethods.map((paymentMethod) {
                                  String method = paymentMethod.keys.first;
                                  double amount = paymentMethod.values.first;

                                  return Container(
                                    width: 250,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(method),

                                        Text("\$${amount.toString()}"),
                                      ],
                                    ),
                                  );
                                }).toList();
                              },
                              onChanged: (value) {
                                setState(() {
                                  selectedPayMethod = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

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
                                    Icon(Icons.discount),

                                    SizedBox(width: 8),

                                    Text(
                                      "Discounts/Vouchers",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                IconButton(
                                  color: Colors.blue,
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

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
                                    Text(
                                      "${widget.flight.airline} (Adult) x${widget.passengers}",
                                    ),

                                    Text(
                                      "\$${widget.flight.price * widget.passengers}",
                                    ),
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

                                    Text(
                                      "\$${(widget.flight.price * widget.passengers)}",
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
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 1)),
            ),
            height: 80,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  if (selectedPayMethod == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please select a payment method."),
                      ),
                    );

                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TicketScreen(
                        passenger: widget.passenger,
                        flight: widget.flight,
                        seat: widget.seat,
                        bookingID: bookingID,
                      ),
                    ),
                  );
                },
                child: Text("Pay Now"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
