import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/models/passenger.dart';
import 'package:task/widgets/flight_search.dart';
import 'package:task/widgets/specialOffers.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme(bool isDarkMode) {
    setState(() {
      themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flight Booking App",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      themeMode: themeMode,
      home: HomePage(themeMode: themeMode, onThemeChanged: toggleTheme),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<bool> onThemeChanged;

  final Passenger passenger = Passenger(
    name: "Fahmid",
    contactNo: "+8801728826321",
    email: "fahmid267@gmail.com",
  );

  HomePage({super.key, required this.themeMode, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Material(
          elevation: 1,
          child: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: Text("FlightApp"),
            centerTitle: true,
            actions: [
              Icon(Icons.circle_notifications_outlined, size: 50),
              Switch(
                value: isDarkMode,
                onChanged: onThemeChanged,
                activeThumbColor: Colors.white,
              ),
            ],
            actionsPadding: EdgeInsets.all(10),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlightSearch(),

              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special Offers",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "View All",
                              style: TextStyle(color: Colors.blue),
                            ),

                            SizedBox(width: 10),

                            Icon(Icons.arrow_forward_ios, color: Colors.blue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              // ListView
              SpecialOffer(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.save_alt), label: "Saved"),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: "Bookings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
