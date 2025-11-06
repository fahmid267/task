import 'package:flutter/material.dart';
import 'package:task/models/passenger.dart';

class PassengerDetails extends StatefulWidget {
  final Function(Passenger) onPassengerChanged;
  
  const PassengerDetails({super.key, required this.onPassengerChanged});
  
  @override
  State<PassengerDetails> createState() => _PassengerDetailsState();
}

class _PassengerDetailsState extends State<PassengerDetails> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final Passenger passenger = Passenger(
    name: "",
    email: "",
    contactNo:  ""
  );

  void updatePassenger() {
    final passenger = Passenger(
      name: nameController.text, 
      contactNo: phoneController.text, 
      email: emailController.text
    );

    widget.onPassengerChanged(passenger);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    Icon(Icons.people),

                    SizedBox(width: 8),

                    Text(
                      "Passenger Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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

            SizedBox(height: 10,),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              onChanged: (value) => updatePassenger(),
            ),

            SizedBox(height: 10,),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              onChanged: (value) => updatePassenger(),
            ),

            SizedBox(height: 10,),

            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Phone no.",
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              onChanged: (value) => updatePassenger(),
            ),
          ],
        ),
      ),
    );
  }
}
