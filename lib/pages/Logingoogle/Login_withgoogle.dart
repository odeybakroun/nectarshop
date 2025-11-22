import 'package:flutter/material.dart';
import 'package:nectarshop/context/colors.dart';
import 'package:nectarshop/src/core/routes/routes.dart';
import 'package:nectarshop/logo_grocery.dart';

class LoginWithgoogle extends StatelessWidget {
  const LoginWithgoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 30),
            const LogoAndWelcome(),
            const SizedBox(height: 30),

            // زر إنشاء الحساب
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.Login);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(color: Colorsapp.primary, width: 2),
                  elevation: 0,
                ),
                child: const Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colorsapp.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const Text(
              "OR",
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),

            // أزرار دائرية
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCircleButton(Icons.g_mobiledata, Colors.red),
                _buildCircleButton(Icons.apple, Colors.black),
                _buildCircleButton(Icons.facebook, Colors.blue),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color, width: 2),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(18),
          backgroundColor: Colors.transparent,
        ),
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }
}
