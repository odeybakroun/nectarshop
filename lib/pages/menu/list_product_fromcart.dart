import 'package:flutter/material.dart';
import 'package:nectarshop/context/colors.dart';
class dataProductcart {
  final String image;
  final String name;
  final String details;
  final double price;
  int quantity;

  dataProductcart({
    required this.image,
    required this.name,
    required this.details,
    required this.price,
    this.quantity = 1,
  });
}

class ListProductFromcart extends StatefulWidget { 
  final List<dataProductcart> products;

  const ListProductFromcart({super.key, required this.products});

  @override
  State<ListProductFromcart> createState() => _ListProductFromcartState();
}

class _ListProductFromcartState extends State<ListProductFromcart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.products.asMap().entries.map((entry) {
        int index = entry.key;
        var product = entry.value;

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ الصورة
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product.image,
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 12),

                  // ✅ الاسم + التفاصيل + أزرار الكمية داخل Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          product.details,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 8),

                        // ✅ أزرار الكمية
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (product.quantity > 1) {
                                    product.quantity--;
                                  }
                                });
                              },
                              child: const Icon(Icons.remove_circle_outline, size: 22),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                product.quantity.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  product.quantity++;
                                });
                              },
                              child: const Icon(Icons.add_circle_outline, size: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // ✅ السعر على اليمين
                  Text(
                    "${product.price.toStringAsFixed(2)} EGP",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colorsapp.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Divider بين العناصر
            if (index != widget.products.length - 1)
              const Divider(height: 1, color: Colors.grey),
          ],
        );
      }).toList(),
    );
  }
}
