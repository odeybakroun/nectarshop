import 'package:flutter/material.dart';

class ProdutsDetails extends StatelessWidget {
  final String name;
  final String details;
  const ProdutsDetails({super.key,required this.name,required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$name Details",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        Text(
          "$details",
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
