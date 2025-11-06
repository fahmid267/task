import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-ticket"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.download))],
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      // color: Colors.grey[300],
                      child: Center(
                        child: Image.asset(
                          "images/ticket_barcode.jpg",
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),

                  Text(
                    "Show your ID and this barcode at the check-in gate.",
                    style: TextStyle(color: Colors.grey),
                  ),

                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Emirates"), Text("Wed, Dec 12 2025")],
                  ),

                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Passenger name"),
                      Text("Fahmid")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Passenger name"),
                      Text("Fahmid")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email"),
                      Text("fahmid267@gmail.com")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Phone no."),
                      Text("+88017726261112")
                    ],
                  ),

                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey,
                  ),

                  Text("Enjoy travelling around the world with us.")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class TicketScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your E-Ticket'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Center(
//           child: Card(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//             elevation: 6,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Ticket header or flight route summary
//                 Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('NYC', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
//                           Text('New York', style: TextStyle(color: Colors.white70)),
//                         ],
//                       ),
//                       Icon(Icons.airplanemode_active, color: Colors.white, size: 40),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text('LAX', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
//                           Text('Los Angeles', style: TextStyle(color: Colors.white70)),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 Divider(
//                   thickness: 2,
//                   indent: 20,
//                   endIndent: 20,
//                   color: Colors.grey[300],
//                 ),

//                 // Ticket details
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                   child: Column(
//                     children: [
//                       _buildTicketInfoRow('Passenger', 'Fahmid'),
//                       _buildTicketInfoRow('Flight No', 'AC123'),
//                       _buildTicketInfoRow('Date', '2025-11-20'),
//                       _buildTicketInfoRow('Seat', '14A'),
//                     ],
//                   ),
//                 ),

//                 // Barcode or QR Code placeholder
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Container(
//                     height: 80,
//                     width: 200,
//                     color: Colors.grey[300],
//                     child: Center(child: Text('Barcode/QR Code', style: TextStyle(color: Colors.black45))),
//                   ),
//                 ),

//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTicketInfoRow(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w600)),
//           Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }
