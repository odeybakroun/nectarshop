import 'package:flutter/material.dart';
import 'package:nectarshop/data/item_menu.dart';

class Menu extends StatelessWidget {
  Menu({super.key});
  final List<ItemsMemu> sampleProducts = [
    ItemsMemu(image: "assets/menu/salad.png", name: 'Fresh Carrots'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
    ItemsMemu(image: "assets/menu/salad.png", name: 'Red Apples'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(10, 10, 10, 0),
          child: GridView.builder(
            itemCount: sampleProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final product = sampleProducts[index];
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(product.image),
                    SizedBox(height: 8),
                    Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
