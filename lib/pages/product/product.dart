import 'package:flutter/material.dart';
import 'package:nectarshop/pages/product/counter_price.dart';
import 'package:nectarshop/pages/product/pageview.dart';
import 'package:nectarshop/pages/product/produts_details.dart';

class Product extends StatelessWidget {
     final String image;
  final String name;
  final String details;
  final double price;
  final int quantity;
 
    Product({super.key,    required this.image,
    required this.name,
    required this.details,
    required this.price,required this.quantity });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("$name Details")),
      body: SafeArea(
        
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // يحاذي كل العناصر لليسار

            children: [
            Pageview(image:image),
            SizedBox(height: 10,),
                Text("$name Details",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),textAlign:TextAlign.start ,),
               
            SizedBox(height: 10,),

            CounterPrice(price: price,counter: quantity,),
            SizedBox(height: 10,),

            ProdutsDetails(name: name,details:details)
            
            ]),
        ),
      ),
    );
  }
}
