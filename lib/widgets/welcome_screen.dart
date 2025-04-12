import 'dart:async';

import 'package:bazar/blocs/welcome_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/design_systems/theme/app_colors.dart';

class WelcomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WelcomeBloc>(
      create: (context) => WelcomeBloc(),
      child: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void initState() {
    super.initState();

    // Đặt hẹn giờ để chuyển trang sau 5 giây
    Timer(Duration(seconds: 5), () {
      // Đảm bảo widget vẫn được mounted trước khi chuyển trang
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final welcomeBloc = Provider.of<WelcomeBloc>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.purplePurple600, // Use AppColors for background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bazar_logo.png',
              width: screenWidth * 0.3, // Adjust logo size
              color: AppColors.white, // Use AppColors for logo color
            ),
            SizedBox(height: 8),
            Text(
              'Bazar.',
              style: TextStyle(
                color: AppColors.white, // Use AppColors for text color
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}