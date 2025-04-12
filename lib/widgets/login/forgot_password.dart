import 'package:flutter/material.dart';
import '../../core/design_systems/theme/app_colors.dart';
import '../../core/design_systems/icons/app_icons.dart';
import '../../core/navigations/routers.dart';
import 'package:fluro/fluro.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  static bool isEmailSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(AppIcons.arrowBack, size: 28),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                "Forgot Password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Description
              const Text(
                "Select which contact details should we use to reset your password",
                style: TextStyle(fontSize: 14, color: AppColors.grey),
              ),

              const SizedBox(height: 20),

              // Email and Phone Number options
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isEmailSelected = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isEmailSelected ? AppColors.purpleLight : AppColors.white,
                          border: Border.all(
                            color: isEmailSelected ? AppColors.purple : AppColors.greyLight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Icon(AppIcons.email, color: isEmailSelected ? AppColors.purple : AppColors.grey),
                            const SizedBox(height: 8),
                            Text(
                              "Email",
                              style: TextStyle(
                                color: isEmailSelected ? AppColors.purple : AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Send to your email",
                              style: TextStyle(color: AppColors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isEmailSelected = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: !isEmailSelected ? AppColors.purpleLight : AppColors.white,
                          border: Border.all(
                            color: !isEmailSelected ? AppColors.purple : AppColors.greyLight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Icon(AppIcons.phone, color: !isEmailSelected ? AppColors.purple : AppColors.grey),
                            const SizedBox(height: 8),
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                color: !isEmailSelected ? AppColors.purple : AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Send to your phone",
                              style: TextStyle(color: AppColors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Continue button
              ElevatedButton(
                onPressed: () {
                  if (isEmailSelected) {
                    Navigator.pushNamed(
                      context,
                      '/reset-password-email',
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      '/reset-password-phone',
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppColors.purple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordWithEmailScreen extends StatelessWidget {
  const ResetPasswordWithEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(AppIcons.arrowBack, size: 28),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                "Reset Password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Description
              const Text(
                "Please enter your email, we will send a verification code to your email.",
                style: TextStyle(fontSize: 14, color: AppColors.grey),
              ),

              const SizedBox(height: 20),

              // Email Input
              TextField(
                decoration: InputDecoration(
                  hintText: "example@email.com",
                  prefixIcon: const Icon(AppIcons.email, color: AppColors.purple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const Spacer(),

              // Send button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/verification-code-forgot-password',
                    arguments: {'isEmail': true},
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppColors.purple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  "Send",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordWithPhoneScreen extends StatelessWidget {
  const ResetPasswordWithPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(AppIcons.arrowBack, size: 28),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                "Reset Password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Description
              const Text(
                "Please enter your phone number, we will send a verification code to your phone number.",
                style: TextStyle(fontSize: 14, color: AppColors.grey),
              ),

              const SizedBox(height: 20),

              // Phone Number Input
              TextField(
                decoration: InputDecoration(
                  hintText: "(+965) 123 435 7565",
                  prefixIcon: const Icon(AppIcons.phone, color: AppColors.purple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const Spacer(),

              // Send button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/verification-code-forgot-password',
                    arguments: {'isEmail': false},
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppColors.purple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  "Send",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationCodeScreen extends StatelessWidget {
  final bool isEmail;

  const VerificationCodeScreen({Key? key, required this.isEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(AppIcons.arrowBack, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                "Verification Code",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Description
              Text(
                isEmail
                    ? "Please enter the code we just sent to email"
                    : "Please enter the code we just sent to phone number (+965) 123 435 7565",
                style: TextStyle(fontSize: 14, color: AppColors.greyDark),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // OTP Input
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  // Resend OTP
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you didn't receive a code? ",
                      style: TextStyle(color: AppColors.greyDark),
                    ),
                    const Text(
                      "Resend",
                      style: TextStyle(
                        color: AppColors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Continue button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/new-password',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.purple,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(AppIcons.arrowBack, size: 28),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                "New Password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Description
              const Text(
                "Create your new password, so you can login to your account.",
                style: TextStyle(fontSize: 14, color: AppColors.grey),
              ),

              const SizedBox(height: 20),

              // New Password Input
              const Text("New Password", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "New Password",
                  prefixIcon: const Icon(AppIcons.lock, color: AppColors.purple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Confirm Password Input
              const Text("Confirm Password", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  prefixIcon: const Icon(AppIcons.lock, color: AppColors.purple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const Spacer(),

              // Send button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/success',
                    arguments: {'type': 1},
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppColors.purple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  "Send",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
