import 'package:flutter/material.dart';

class FlightSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlightSearchState();
  }
}

class FlightSearchState extends State<FlightSearch> {
  var trip = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      trip = "One-Way";
                    });
                  },
                  child: Text("One-Way"),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      trip = "Round Trip";
                    });
                  },
                  child: Text("Round Trip"),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      trip = "Multi-City";
                    });
                  },
                  child: Text("Multi-City"),
                ),
              ],
            ),

            // from input field with dropdown option when user starts typing
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("From"),
              ),
            ),
            
            // to input field with dropdown option when user starts typing
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("To")
              ),
            ),

            // date selection field
            // GestureDetector(
            //   onTap: () => ,
            // )

            Row(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Passengers")
                  ),
                ),
                
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Class")
                  ),
                )
              ],
            ),

            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Search Flights",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blue,
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
                  // minimumSize: MaterialStateProperty.all<Size>(Size(500, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class FlightSearch extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return FlightSearchState();
//   }
// }

// class FlightSearchState extends State<FlightSearch> {
//   var trip = null;
//   TextEditingController fromController = TextEditingController();
//   TextEditingController toController = TextEditingController();
//   DateTime selectedDate = DateTime.now();
//   List<String> airports = ["New York", "Los Angeles", "Chicago", "San Francisco", "Miami"]; // Example airports list

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         border: Border.all(width: 1),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             // Trip options (One-Way, Round Trip, Multi-City)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 OutlinedButton(
//                   onPressed: () {
//                     setState(() {
//                       trip = 'One-Way';
//                     });
//                   },
//                   child: Text("One-Way"),
//                 ),
//                 OutlinedButton(
//                   onPressed: () {
//                     setState(() {
//                       trip = 'Round Trip';
//                     });
//                   },
//                   child: Text("Round Trip"),
//                 ),
//                 OutlinedButton(
//                   onPressed: () {
//                     setState(() {
//                       trip = 'Multi-City';
//                     });
//                   },
//                   child: Text("Multi-City"),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),

//             // From input field with dropdown option when user starts typing
//             _buildFromInputField(),
//             SizedBox(height: 10),

//             // To input field with dropdown option when user starts typing
//             _buildToInputField(),
//             SizedBox(height: 10),

//             // Date selection field
//             _buildDateSelectionField(),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper method for From input field with dropdown suggestions
//   Widget _buildFromInputField() {
//     return Autocomplete<String>(
//       optionsBuilder: (TextEditingValue textEditingValue) {
//         return airports.where((airport) =>
//             airport.toLowerCase().contains(textEditingValue.text.toLowerCase()));
//       },
//       onSelected: (selected) {
//         setState(() {
//           fromController.text = selected;
//         });
//       },
//       fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
//         return TextField(
//           controller: controller,
//           focusNode: focusNode,
//           decoration: InputDecoration(
//             labelText: 'From',
//             border: OutlineInputBorder(),
//           ),
//         );
//       },
//     );
//   }

//   // Helper method for To input field with dropdown suggestions
//   Widget _buildToInputField() {
//     return Autocomplete<String>(
//       optionsBuilder: (TextEditingValue textEditingValue) {
//         return airports.where((airport) =>
//             airport.toLowerCase().contains(textEditingValue.text.toLowerCase()));
//       },
//       onSelected: (selected) {
//         setState(() {
//           toController.text = selected;
//         });
//       },
//       fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
//         return TextField(
//           controller: controller,
//           focusNode: focusNode,
//           decoration: InputDecoration(
//             labelText: 'To',
//             border: OutlineInputBorder(),
//           ),
//         );
//       },
//     );
//   }

//   // Helper method for Date selection field
//   Widget _buildDateSelectionField() {
//     return GestureDetector(
//       onTap: () async {
//         DateTime? pickedDate = await showDatePicker(
//           context: context,
//           initialDate: selectedDate,
//           firstDate: DateTime(2020),
//           lastDate: DateTime(2101),
//         );
//         if (pickedDate != null && pickedDate != selectedDate) {
//           setState(() {
//             selectedDate = pickedDate;
//           });
//         }
//       },
//       child: AbsorbPointer(
//         child: TextField(
//           controller: TextEditingController(
//             text: '${selectedDate.toLocal()}'.split(' ')[0], // Format the date
//           ),
//           decoration: InputDecoration(
//             labelText: 'Select Date',
//             border: OutlineInputBorder(),
//           ),
//         ),
//       ),
//     );
//   }
// }
