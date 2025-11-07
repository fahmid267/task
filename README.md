# task

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Flight Booking App

## Implementation Approach

The UI was built first independently without any data passing to visualize the UI of the complete app before any data handling.
- UI of each page was built sequentially.
- Sequence and details of building page UIs:
  1. Home Page: Built the appbar and bottom navigation tab first, then the flight searching container and the special offers section.
  2. Available Flights Page: Available flights were displayed using Card widget with hardcoded flight data.
  3. Flight Details Page: Hardcoded flight data were displayed.
  4. Flight Booking Page: Dummy flight and booking data were displayed.
  5. Payment Confirmation Page: Dummy payment info was used to display this page.
  6. E-ticket Screen: A visualization of the e-ticket was built using hardcoded information.


Static data handling was done after the whole UI was built.
- ### The app was made to work for "One-Way" trip only.
- Static flight data has been used to filter available flights based on user input.
- The selected flight data is passed down to following pages to display their details on Card widgets.
- In the process, all the hardcoded data was substituted with the selected flight's data in all the pages by static data sharing across multiple pages.
- Static data sharing enables the pages, along with the e-ticket to display the selected flight and passenger's data.

- After the above steps, the dark mode option was built inside the drawer widget.