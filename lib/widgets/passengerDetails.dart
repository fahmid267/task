import 'package:flutter/material.dart';

class PassengerDetails extends StatefulWidget {
  const PassengerDetails({super.key});

  @override
  State<PassengerDetails> createState() => _PassengerDetailsState();
}

class _PassengerDetailsState extends State<PassengerDetails> {
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

                // IconButton(
                //   color: Colors.blue,
                //   onPressed: () {},
                //   icon: Icon(Icons.edit),
                // ),
              ],
            ),

            Divider(
              thickness: 1,
              color: Colors.grey,
            ),

            SizedBox(height: 10,),

            TextField(
              decoration: InputDecoration(
                labelText: "Name",
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),

            SizedBox(height: 10,),

            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),

            SizedBox(height: 10,),

            TextField(
              decoration: InputDecoration(
                labelText: "Phone no.",
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
