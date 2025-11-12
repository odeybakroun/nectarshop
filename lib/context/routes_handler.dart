 
 
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nectarshop/boardingbages/first_boarding.dart';
import 'package:nectarshop/context/routes_name.dart';
import 'package:nectarshop/pages/Logingoogle/Login_withgoogle.dart';
import 'package:nectarshop/pages/cart/addpayment.dart';
import 'package:nectarshop/pages/cart/cart.dart';
import 'package:nectarshop/pages/data/products.dart';
 import 'package:nectarshop/pages/home/home.dart';
 import 'package:nectarshop/pages/introLogin/intro_login.dart';
import 'package:nectarshop/pages/login/login.dart';
import 'package:nectarshop/pages/product/product.dart';
import 'package:nectarshop/pages/profile/profile.dart';
 import 'package:nectarshop/pages/search/search.dart';
 

class RoutesHandler {
  //LoginWithgoogle
 
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      
case RoutesName.Product:
final product = settings.arguments as dataProduct;
  return MaterialPageRoute(
    builder: (context) => Product(image: product.image,name: product.name,details: product.details,price: product.price,quantity: product.quantity),
  );




      case RoutesName.boarding:
         return MaterialPageRoute(
          builder: (context) => FirstBoarding( ),
        );
      case RoutesName.Cart:
         return MaterialPageRoute(
          builder: (context) => Cart( ),
        );
          case RoutesName.Login:
         return MaterialPageRoute(
          builder: (context) => Login( ),
        );
   case RoutesName.LoginWithgoogle:
         return MaterialPageRoute(
          builder: (context) => LoginWithgoogle( ),
        );

        case RoutesName.IntroLogin:
          return MaterialPageRoute(
          builder: (context) => IntroLogin( ),
        );

           case RoutesName.Home:
          return MaterialPageRoute(
          builder: (context) => Home( ),
        );
           case RoutesName.Search:
          return MaterialPageRoute(
          builder: (context) => Search( ),
        );
           case RoutesName.Addpayment:
          return MaterialPageRoute(
          builder: (context) => Addpayment( ),
        );
           case RoutesName.Profile:
          return MaterialPageRoute(
          builder: (context) => Profile( ),
        );

      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Center(
            child: Text('No Route Defind'),
          ),


        ));
    }
  } 
}
