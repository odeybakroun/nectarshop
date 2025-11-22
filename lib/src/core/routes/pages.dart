
    library route_pages;
 
 
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nectarshop/boardingbages/first_boarding.dart';
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
import 'package:nectarshop/src/core/routes/routes.dart';
import 'package:nectarshop/src/features/users/presentation/pages/register.dart';
     
class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.Product:
        final product = settings.arguments as dataProduct;
        return MaterialPageRoute(
          builder: (context) => Product(
            image: product.image,
            name: product.name,
            details: product.details,
            price: product.price,
            quantity: product.quantity,
          ),
        );

      case RoutesName.boarding:
        return MaterialPageRoute(builder: (_) => FirstBoarding());
      case RoutesName.Cart:
        return MaterialPageRoute(builder: (_) => Cart());
      case RoutesName.Login:
        return MaterialPageRoute(builder: (_) => Login());
      case RoutesName.Register:
        return MaterialPageRoute(builder: (_) => Register());
      case RoutesName.LoginWithgoogle:
        return MaterialPageRoute(builder: (_) => LoginWithgoogle());
      case RoutesName.IntroLogin:
        return MaterialPageRoute(builder: (_) => IntroLogin());
      case RoutesName.Home:
        return MaterialPageRoute(builder: (_) => Home());
      case RoutesName.Search:
        return MaterialPageRoute(builder: (_) => Search());
      case RoutesName.Addpayment:
        return MaterialPageRoute(builder: (_) => Addpayment());
      case RoutesName.Profile:
        return MaterialPageRoute(builder: (_) => Profile());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No Route Defined')),
          ),
        );
    }
  }
}
