import 'package:flutter/material.dart';
import 'package:task/models/flight.dart';
import 'package:task/pages/ticketScreen.dart';

class PaymentConfirmation extends StatelessWidget {
  final Flight flight;

  // final Passenger passenger = Passenger(
  //   name: "Fahmid",
  //   contactNo: "+8801728826321",
  //   email: "fahmid267@gmail.com",
  // );

  const PaymentConfirmation({super.key, required this.flight});

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
                    Card(
                      elevation: 1,
                      margin: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 10,
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  flight!.airline,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  flight.date.toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),

                            SizedBox(height: 15),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      flight!.from,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      flight!.departureTime,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),

                                Container(
                                  child: Column(
                                    children: [Text("time"), Text("Direct")],
                                  ),
                                ),

                                Column(
                                  children: [
                                    Text(
                                      flight!.to,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      flight!.arrivalTime,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

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
                                      "Payment Methid",
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
                                  icon: Icon(Icons.edit),
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
                                    Icon(Icons.bar_chart),

                                    SizedBox(width: 8),

                                    Text(
                                      "My points",
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
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            ),

                            Text(
                              "100 points equals \$1.00. You will get 1,000 points after this",
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
                    MaterialPageRoute(builder: (context) => TicketScreen())
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
