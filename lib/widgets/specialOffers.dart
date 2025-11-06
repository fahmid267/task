import 'package:flutter/material.dart';

class SpecialOffer extends StatefulWidget {
  const SpecialOffer({super.key});

  @override
  State<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
  var sp_offers = [
    {"img": "assets/images/card_1.jpg", "title": "Offer 1"},
    {"img": "assets/images/card_2.png", "title": "Offer 2"},
    {"img": "assets/images/card_3.png", "title": "Offer 3"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sp_offers.length,
        itemBuilder: (context, index) {
          final offer = sp_offers[index];

          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${sp_offers[index]["title"]} clicked"))
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 15),
              width: 325,
              height: 200,
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadiusGeometry.circular(25),
                child: Image.asset(offer["img"]!, fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
