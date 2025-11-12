import 'package:flutter/material.dart';
import 'package:nectarshop/context/colors.dart';
import 'package:nectarshop/context/routes_name.dart';

class ContentIntrologin extends StatelessWidget {
  const ContentIntrologin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // 👈 هنا مكانها الصحيح
          children: [
            // 🔹 النصوص
            Container(
              child: Column(
                children:   [
                  Text("Welcome To Our", style: TextStyle(fontSize: 30)),
                  Text(
                    "E-Grocery",
                    style: TextStyle(fontSize: 30, color: Colorsapp.primary),
                  ),
                ],
              ),
            ),

            // 🔹 الأزرار
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.LoginWithgoogle,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colorsapp.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Continue with Email or phone',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // 👈 مسافة بين الزرين
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: const BorderSide(
                          color: Colorsapp.primary,
                          width: 2,
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colorsapp.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
