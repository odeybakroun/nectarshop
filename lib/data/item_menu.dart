import 'package:flutter/material.dart';

class ItemsMemu {
  final String image;
  final String name;

  ItemsMemu({required this.image, required this.name});
}

class ItemMenu extends StatefulWidget {
  final List<ItemsMemu> menu;

  const ItemMenu({super.key, required this.menu});

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // قللنا ارتفاع الكارد
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.menu.length,
        itemBuilder: (context, index) {
          final product = widget.menu[index];
          return Container(
            width: 140, // قللنا عرض الكارد قليلاً
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: Card(
              color: Colors.white,
              elevation: 3, // إضافة ظل للكارد
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8), // تقليل البادينج
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        product.image,
                        width: 60,
                        height: 30, // تحديد ارتفاع الصورة
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12, // جعل النص أصغر
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
