import 'package:flutter/material.dart';

class FlightAmenities extends StatelessWidget {
  const FlightAmenities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Text("Cabin baggage 1 x 7 kg"),
            Text("Baggage 1 x 20 kg"),
            Text("Reschedule Available"),
            Text("Refundable"),
            Text("Travel Insurance Included"),
          ],
        ),

        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 5,
              children: [
                Icon(Icons.food_bank),
                Icon(Icons.tv),
                Icon(Icons.wifi),
              ],
            ),

            TextButton(
              onPressed: () {},
              child: Text("Details", style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ],
    );
  }
}
