import 'package:flutter/material.dart';
import '../../core/navigations/routers.dart';

class SuccessScreen extends StatelessWidget {
  final int type; // 1: Sign Up Success, 2: Password Changed Success

  const SuccessScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    // Xác định nội dung dựa vào type
    String title = type == 1 ? "Congratulation!" : "Password Changed!";
    String subtitle = type == 1
        ? "Your account is complete, please enjoy the best menu from us."
        : "Password changed successfully, you can login again with a new password.";
    String buttonText = type == 1 ? "Get Started" : "Login";

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/success.png", height: 150), // Icon thành công
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  
                },
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
