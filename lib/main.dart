import 'package:flutter/material.dart';
import 'package:nectarshop/boardingbages/first_boarding.dart';
import 'package:nectarshop/context/routes_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nectar shop',
      theme: ThemeData(
 
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
            onGenerateRoute: RoutesHandler().generateRoute,
            
      );
  }
}
 