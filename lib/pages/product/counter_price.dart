import 'package:flutter/material.dart';
import 'package:nectarshop/context/colors.dart';

class CounterPrice extends StatefulWidget {
  final double price;
  final int counter;
  const CounterPrice({super.key,required this.price, required this.counter});

  @override
  State<CounterPrice> createState() => _CounterPriceState();
}

class _CounterPriceState extends State<CounterPrice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // الأسعار
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // السعر القديم مشطوب
            Text(
              "\$30",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: 4),
            // السعر الحالي
            Text(
           
             "${  widget.price.toStringAsFixed(2)} EGP",
             
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colorsapp.primary,
              ),
            ),
          ],
        ),
        counterrow(counter:widget.counter),
      ],
    );
  }
}

class counterrow extends StatefulWidget {
  final int counter;
  const counterrow({super.key, required this.counter});

  @override
  State<counterrow> createState() => _counterState();
}

class _counterState extends State<counterrow> {
  late int counter;
   
  @override
  void initState() {
    super.initState();
    counter = widget.counter;  
  }

  void increment() => setState(() => counter++);
  void decrement() => setState(() {
        if (counter > 0) counter--;
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: 20,
            icon: const Icon(Icons.remove, color: Colors.black),
            onPressed: decrement,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '$counter',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: 20,
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: increment,
          ),
        ),
      ],
    );
  }
}
