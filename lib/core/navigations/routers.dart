import 'package:bazar/widgets/login/onboarding.dart';
import 'package:bazar/widgets/welcome_screen.dart';  // Đảm bảo đường dẫn đúng
import 'package:bazar/widgets/login/forgot_password.dart';
import 'package:bazar/widgets/login/login.dart';
import 'package:bazar/widgets/login/signup.dart';
import 'package:bazar/widgets/login/success.dart';
import 'package:bazar/widgets/login/verification.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../../widgets/welcome_screen.dart';
import 'package:bazar/widgets/home/home.dart'; // Import HomeScreen
import 'package:bazar/widgets/home/vendors.dart'; // Import VendorsScreen

class BazarRouter {
  static final FluroRouter router = FluroRouter();

  // Sửa ký tự * thành dấu gạch dưới _
  static final Handler _welcomeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return WelcomeProvider(); // Đảm bảo sử dụng WelcomeProvider
      });

  static final Handler _onBoardingHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return OnBoardingProvider(); // Đảm bảo sử dụng OnBoardingProvider
      });

  // Handlers for new routes
  static final Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const LoginScreen();
  });

  static final Handler _signupHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const SignUpScreen();
  });

  static final Handler _forgotPasswordHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const ForgotPasswordScreen();
  });

  static final Handler _verificationHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    final isEmail = params['isEmail']?.first == 'true';
    return VerificationScreen(email: isEmail ? 'example@email.com' : '');
  });

  static final Handler _successHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    final type = int.tryParse(params['type']?.first ?? '1') ?? 1;
    return SuccessScreen(type: type);
  });

  static final Handler _resetPasswordEmailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const ResetPasswordWithEmailScreen(); // Đảm bảo sử dụng const
  });

  static final Handler _resetPasswordPhoneHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const ResetPasswordWithPhoneScreen(); // Đảm bảo sử dụng const
  });

  static final Handler _verificationForgotPasswordHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    final isEmail = params['isEmail']?.first == 'true';
    return VerificationCodeScreen(isEmail: isEmail); // Truyền tham số chính xác
  });

  static final Handler _newPasswordHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const NewPasswordScreen(); // Đảm bảo sử dụng const
  });

  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return HomeScreen(); // Removed 'const' to allow non-constant constructor
  });

  static final Handler _vendorsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const VendorsScreen(); // Ensure VendorsScreen is used
  });

  static void setupRouter() {
    router.define(
      '/',
      handler: _welcomeHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/onboarding',
      handler: _onBoardingHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/login',
      handler: _loginHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/signup',
      handler: _signupHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/forgot-password',
      handler: _forgotPasswordHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/verification-code',
      handler: _verificationHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/success',
      handler: _successHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/reset-password-email',
      handler: _resetPasswordEmailHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/reset-password-phone',
      handler: _resetPasswordPhoneHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/verification-code-forgot-password',
      handler: _verificationForgotPasswordHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/new-password',
      handler: _newPasswordHandler, // Thêm handler cho NewPasswordScreen
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/home',
      handler: _homeHandler, // Add handler for HomeScreen
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/vendors',
      handler: _vendorsHandler, // Add handler for VendorsScreen
      transitionType: TransitionType.inFromRight,
    );
  }
}