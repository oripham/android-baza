import 'package:bazar/core/navigations/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/design_systems/theme/theme.dart';
import 'core/utils/app_constants.dart';
import 'core/design_systems/theme/app_colors.dart';
import 'core/design_systems/icons/app_icons.dart';
import 'widgets/login/forgot_password.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Thiết lập router trước khi runApp
  BazarRouter.setupRouter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Sử dụng một kích thước cố định cho designSize - thường dựa theo thiết kế Figma/XD
      designSize: const Size(375, 812), // hoặc kích thước thiết kế của bạn
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Appconstants.APP_TITLE,
          theme: BMaterialTheme.light().copyWith(
            primaryColor: AppColors.primary, // Example usage of app_color
          ),
          themeMode: ThemeMode.light,
          onGenerateRoute: BazarRouter.router.generator,
          initialRoute: '/',
          routes: {
            '/forgot-password': (context) => const ForgotPasswordScreen(),
            '/reset-password-email': (context) => const ResetPasswordWithEmailScreen(),
            '/reset-password-phone': (context) => const ResetPasswordWithPhoneScreen(),
            '/verification-code-forgot-password': (context) {
              final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
              final isEmail = args?['isEmail'] ?? true; // Default to true if not provided
              return VerificationCodeScreen(isEmail: isEmail);
            },
            '/new-password': (context) => const NewPasswordScreen(),
          },
        );
      },
    );
  }
}