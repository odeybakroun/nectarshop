import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:nectarshop/context/colors.dart';
import 'package:nectarshop/src/core/routes/routes.dart';
import 'package:nectarshop/pages/cart/cart.dart';
import 'package:nectarshop/pages/data/products.dart';
import 'package:nectarshop/pages/home/Pageviewapp.dart';
import 'package:nectarshop/pages/menu/menu.dart';
import 'package:nectarshop/pages/profile/profile.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late MotionTabBarController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = MotionTabBarController(
      initialIndex: 0, // يبدأ بالتاب الأول
      length: 5, // عدد التابات
      vsync: this,
    );
  }

  final List<String> tabLabels = ["Home", "Menu", "Cart", "Save", "Profile"];
  List<Widget> _tabPages = [
    homepage(),
   Menu(),
    Cart(),
    Center(child: Text("صفحة الملف Save", style: TextStyle(fontSize: 20))),
   Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colorsapp.primary),
              child: Text(
                'القائمة الجانبية',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('الرئيسية'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('الإعدادات'),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: _tabPages[_selectedIndex], // يعرض محتوى التاب الحالي,
      ),

      bottomNavigationBar: MotionTabBar(
        labels: tabLabels,
        icons: const [
          Icons.home,
          Icons.favorite,
          Icons.shopping_cart,
          Icons.person,
          Icons.person,
        ],
        initialSelectedTab: tabLabels[0],
        tabSize: 50,
        tabBarHeight: 60,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        tabIconColor: Colors.grey,
        tabIconSelectedColor: Colors.white,
        tabSelectedColor: Colorsapp.primary,
        tabBarColor: Colors.white,
        controller: _controller,
        onTabItemSelected: (index) {
          setState(() {
            _selectedIndex = index; // نغير التاب المختار
            _controller.index = index;
          });
        },
      ),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});
 
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List<dataProduct> sampleProducts = [
    dataProduct(
      image: 'assets/images/item1.png',
      name: 'Fresh Carrots',
      details: 'BBBB farm carrots 1kg',
      price: 25.0,
    ),
    dataProduct(
      image: 'assets/images/item.png',
      name: 'Red Apples',
      details: 'VVVVV and sweet apples 1kg',
      price: 43.0,
    ),
    dataProduct(
      image: 'assets/images/item.png',
      name: 'Red Apples',
      details: 'CCCC and sweet apples 1kg',
      price: 22.0,
    ),
    dataProduct(
      image: 'assets/images/item3.png',
      name: 'Red Apples',
      details: 'DDDD and sweet apples 1kg',
      price: 11.0,
    ),
    dataProduct(
      image: 'assets/images/item4.png',
      name: 'Red Apples',
      details: 'WWWW and sweet apples 1kg',
      price: 365.0,
    ),
    dataProduct(
      image: 'assets/images/item5.png',
      name: 'Red Apples',
      details: 'EEEEE and sweet apples 1kg',
      price: 76.0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, size: 30),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: Image.asset("assets/images/applogo.png", height: 32),
          actions: [
            IconButton(
              icon: Icon(Icons.search, size: 30),
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.Search);
              },
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                Pageviewapp(),
                const SizedBox(height: 7),
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 8),
                        child: Text("Start"),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.only(end: 8),
                        child: Text("End"),
                      ),
                    ],
                  ),
                ),
                ListProducts(products: sampleProducts),
                const SizedBox(height: 7),
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.only(start: 8),
                        child: Text("Start"),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.only(end: 8),
                        child: Text("End"),
                      ),
                    ],
                  ),
                ),
                ListProducts(products: sampleProducts),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
