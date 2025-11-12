import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectarshop/context/routes_name.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             Stack(
              children: [
                ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        height: 400,
        child: SvgPicture.asset(
          'assets/images/backg.svg',
          fit: BoxFit.cover,
        ),
      ),
    ), 

                // محتوى البيانات الشخصية وأول Container
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ), // مسافة من الأعلىD:\Flutter\firstprogect\new\nectarshop\assets\images\imgprofile.png
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/imgp.png'),
                    ),

                    SizedBox(height: 16),
                    Text(
                      'Oday Rami',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black54,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'ID: 123456',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colors.black45,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          itembar(
                            icon: Icon(Icons.car_crash),
                            title: "My orders",
                          ),
                          itembar(
                            icon: Icon(Icons.card_giftcard_outlined),
                            title: "Voucher",
                          ),
                          itembar(
                            icon: Icon(Icons.home_max_outlined),
                            title: "Address",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 16),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white, // لون الغلاس
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SettingsPage(),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class itembar extends StatelessWidget {
  final Icon icon;
  final String title;
  const itembar({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: FittedBox(
            fit: BoxFit.contain, // يجعل الأيقونة تكبر داخل المساحة
            child: icon,
          ),
        ),
        Expanded(flex: 1, child: Text(title)),
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  final List<Map<String, dynamic>> settingsItems = const [
    {"icon": Icons.person, "title": "Profile"},
    {"icon": Icons.notifications, "title": "Notifications"},
    {"icon": Icons.lock, "title": "Privacy"},
    {"icon": Icons.help, "title": "Help & Support"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true, // مهم جداً لتقليص ارتفاع ListV  iew حسب المحتوى
      physics: NeverScrollableScrollPhysics(), // منع التمرير الداخلي
      padding: EdgeInsets.all(16),
      itemCount: settingsItems.length,
      separatorBuilder: (context, index) => Divider(), // خط بين العناصر
      itemBuilder: (context, index) {
        final item = settingsItems[index];
        return ListTile(
          leading: Icon(item['icon'], color: Colors.black),
          title: Text(item['title']),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            Navigator.pushNamed(context, RoutesName.Home);
          },
        );
      },
    );
  }
}

/*class itembar extends StatelessWidget {
  final Icon icon;
  final String title;
  const itembar({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: FittedBox(
            fit: BoxFit.contain, // يجعل الأيقونة تكبر داخل المساحة
            child: icon,
          ),
        ),
        Expanded(flex: 1, child: Text(title)),
      ],
    );
  }
} */
