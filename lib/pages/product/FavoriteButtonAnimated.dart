import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class FavoriteButtonAnimated extends StatelessWidget {
  final double size;
  const FavoriteButtonAnimated({super.key, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: size,
      circleColor: CircleColor(start: Colors.red, end: Colors.pink),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Colors.red,
        dotSecondaryColor: Colors.pink,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: isLiked ? Colors.red : Colors.grey,
          size: size,
        );
      },
    );
  }
}
