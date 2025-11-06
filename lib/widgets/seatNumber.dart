import 'package:flutter/material.dart';

class SeatNumber extends StatefulWidget {
  const SeatNumber({super.key});

  @override
  State<SeatNumber> createState() => _SeatNumberState();
}

class _SeatNumberState extends State<SeatNumber> {
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
                    Icon(Icons.chair_sharp),

                    SizedBox(width: 8),

                    Text(
                      "Seat Number",
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

            DropdownButtonFormField(
              items: List.generate(20, (index) => index + 1).map(
                (num) => DropdownMenuItem(
                  value: num,
                  child: Text(num.toString())
                )
              ).toList(),
              onChanged: null,
              decoration: InputDecoration(
                labelText: "Select Seat Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
