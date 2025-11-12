import 'package:flutter/material.dart';

class Boarding extends StatelessWidget {
  final String URL;
  final String title;
  final String body;
  final int page;
  const Boarding({
    super.key,
    required this.URL,
    required this.title,
    required this.body,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(URL, fit: BoxFit.cover, width: 250, height: 250),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              body,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
