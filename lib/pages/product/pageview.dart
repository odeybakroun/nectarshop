import 'package:flutter/material.dart';
import 'package:nectarshop/context/colors.dart';
import 'package:nectarshop/pages/product/FavoriteButtonAnimated.dart';

class Pageview extends StatelessWidget {
  final String image;
  const Pageview({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),

            color: Colorsapp.pageviewcolor,
          ),

          child: Image.asset(image),
        ),
        Positioned(right: 8, top: 8, child: FavoriteButtonAnimated(size: 30)),
      ],
    );
  }
}
