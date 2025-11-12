import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BackgroundIntrologin extends StatelessWidget {
  const BackgroundIntrologin({super.key, required this.imageURL});
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      imageBuilder: (context, imageProvider) =>
          _introloginbody(image: imageProvider),
      placeholder: (context, url) => skeleton(),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: Colors.red),
    );
  }
}

class _introloginbody extends StatelessWidget {
  const _introloginbody({super.key, required this.image});
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.fill),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
         ),
      ],
    );
  }
}

class skeleton extends StatelessWidget {
  const skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("يتم تحميل الصفحه ...")));
  }
}
