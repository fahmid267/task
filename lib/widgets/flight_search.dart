import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/pages/flights.dart';

class FlightSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlightSearchState();
  }
}

class FlightSearchState extends State<FlightSearch> {
  // final isDark = Theme.of(context).brightness == Brightness.dark;

  final List<String> airports = [
    "Dhaka (DAC)",
    "New York (JFK)",
    "Los Angeles (LAX)",
    "London (LHR)",
    "Singapore (SIN)",
    "Paris (CDG)",
  ];
  final List<String> classes = ["Economy", "Business", "First-Class"];

  String? trip;
  String? fromAirport;
  String? toAirport;
  DateTime? departureDate;
  int passengers = 1;
  String? flightClass;

  // final fromController = TextEditingController();
  // final toController = TextEditingController();
  // final passengerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          trip = "One-Way";
                        });
                      },
                      child: Text("One-Way",),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: trip == "One-Way"
                            ? Colors.blue
                            : Colors.transparent,
                        foregroundColor: trip == "One-Way"
                            ? Colors.white
                            : Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 2)
                      ),
                    ),
                  ),

                  SizedBox(width: 5,),

                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          trip = "Round Trip";
                        });
                      },
                      child: Text("Round Trip",),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: trip == "Round Trip"
                            ? Colors.blue
                            : Colors.transparent,
                        foregroundColor: trip == "Round Trip"
                            ? Colors.white
                            : Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 2)
                      ),
                    ),
                  ),

                  SizedBox(width: 5,),

                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          trip = "Multi-City";
                        });
                      },
                      child: Text("Multi-City"),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: trip == "Multi-City"
                            ? Colors.blue
                            : Colors.transparent,
                        foregroundColor: trip == "Multi-City"
                            ? Colors.white
                            : Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 2)
                      ),
                    ),
                  ),
                ],
              ),

              
              // From Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "From",
                  prefixIcon: Icon(Icons.flight_takeoff),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                items: airports.map((String airport) {
                  return DropdownMenuItem<String>(
                    value: airport,
                    child: Text(airport),
                  );
                }).toList(),
                onChanged: (value) {
                  fromAirport = value;
                },
              ),

              
              // To Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "To",
                  prefixIcon: Icon(Icons.flight_land),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                items: airports.map((String airport) {
                  return DropdownMenuItem<String>(
                    value: airport,
                    child: Text(airport),
                  );
                }).toList(),
                onChanged: (value) {
                  toAirport = value;
                },
              ),

              
              // Date
              GestureDetector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: departureDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );
                  if (picked != null && picked != departureDate) {
                    setState(() {
                      departureDate = picked;
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: departureDate == null
                          ? "Date"
                          : "${departureDate!.day}/${departureDate!.month}/${departureDate!.year}",
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  // Passengers selection
                  Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 2),
                        label: Text(
                          "Passengers",
                          style: TextStyle(fontSize: 9),
                        ),
                        prefixIcon: Icon(Icons.people),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      items: List.generate(10, (index) => index + 1)
                          .map(
                            (num) => DropdownMenuItem(
                              value: num,
                              child: Text(num.toString()),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            passengers = value;
                          }
                        });
                      },
                    ),
                  ),

                  SizedBox(width: 5),

                  
                  // Flight Class
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Class",
                        prefixIcon: Icon(Icons.flight_class),
                      ),
                      items: classes.map((String cls) {
                        return DropdownMenuItem<String>(
                          value: cls,
                          child: Text(cls),
                        );
                      }).toList(),
                      onChanged: ((value) {
                        flightClass = value;
                      }),
                    ),
                  ),
                ],
              ),

              
              // Search Flight Button
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (trip == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please select trip type.")),
                      );

                      return;
                    }

                    if (fromAirport == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select departure airport"),
                        ),
                      );

                      return;
                    }

                    if (toAirport == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select arrival airport"),
                        ),
                      );

                      return;
                    }

                    if (departureDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please select date.")),
                      );

                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlightsPage(
                          trip: trip!,
                          from: fromAirport!,
                          to: toAirport!,
                          date: departureDate!,
                          passengers: passengers,
                          flightClass: flightClass!,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.blue,
                    ),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      EdgeInsets.all(20),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "Search Flights",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}