import 'package:flutter/material.dart';
import 'package:nectarshop/context/routes_name.dart';
import 'package:nectarshop/pages/introLogin/background_intrologin.dart';
import 'package:nectarshop/pages/introLogin/content_intrologin.dart';

class IntroLogin extends StatelessWidget {
  const IntroLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: Stack(children: [
        BackgroundIntrologin(imageURL: RoutesName.imageURL),
        ContentIntrologin()
     ],),


    );
  }
}