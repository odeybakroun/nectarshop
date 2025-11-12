import 'package:flutter/material.dart';
import 'package:nectarshop/context/routes_name.dart';
import 'package:nectarshop/pages/menu/list_product_fromcart.dart';

class Cart extends StatefulWidget {
  Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final TextEditingController _couponController = TextEditingController();

  final List<dataProductcart> sampleProducts = [
    dataProductcart(
      image: 'assets/images/item1.png',
      name: 'Fresh Carrots',
      details: 'BBBB farm carrots 1kg',
      price: 25.0,
    ),
    dataProductcart(
      image: 'assets/images/item.png',
      name: 'Red Apples',
      details: 'VVVVV and sweet apples 1kg',
      price: 43.0,
    ),
    dataProductcart(
      image: 'assets/images/item4.png',
      name: 'Red Apples',
      details: 'CCCC and sweet apples 1kg',
      price: 22.0,
    ),
    dataProductcart(
      image: 'assets/images/item3.png',
      name: 'Red Apples',
      details: 'DDDD and sweet apples 1kg',
      price: 11.0,
    ),
  ];

  bool visabilty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // أي محتوى ثابت فوق القائمة
            Text(
              "سلة المشتريات",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            ListProductFromcart(products: sampleProducts),

            Text(
              "Add coupon",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 5),

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        visabilty = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Coupon',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),

                      // ✅ البوردر مع radius بدون لون مرئي
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: visabilty ? () {} : null,
                  child: const Text("إتمام الدفع"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.Addpayment);
              },
              child: const Text("إتمام الدفع"),
            ),
          ],
        ),
      ),
    );
  }
}
