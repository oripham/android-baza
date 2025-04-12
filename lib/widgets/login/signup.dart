import 'package:flutter/material.dart';
import '../../core/design_systems/theme/app_colors.dart';
import '../../core/navigations/routers.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _showPasswordErrors = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isPasswordValid(String password) {
    return password.length >= 8 &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[a-zA-Z]').hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Create account and choose favorite menu",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                const Text("Name", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text("Email", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Your email",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text("Password", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: "Your password",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    bool isValid = _isPasswordValid(value);
                    if (_showPasswordErrors != !isValid) {
                      setState(() {
                        _showPasswordErrors = !isValid;
                      });
                    }
                  },
                ),
                if (_showPasswordErrors) Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _passwordCriteria("Minimum 8 characters", _passwordController.text.length >= 8),
                      _passwordCriteria("At least 1 number (1-9)", RegExp(r'[0-9]').hasMatch(_passwordController.text)),
                      _passwordCriteria("At least one letter", RegExp(r'[a-zA-Z]').hasMatch(_passwordController.text)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showPasswordErrors = !_isPasswordValid(_passwordController.text);
                    });

                    if (!_showPasswordErrors) {
                      Navigator.pushNamed(context, '/verification-code', arguments: {'email': _emailController.text});
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppColors.purple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Have an account? ",
                      style: const TextStyle(color: AppColors.black),
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(color: AppColors.purple, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "By clicking Register, you agree to our\n",
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      children: const [
                        TextSpan(
                          text: "Terms, Data Policy.",
                          style: TextStyle(color: AppColors.purple),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordCriteria(String text, bool isValid) {
    return Row(
      children: [
        Icon(isValid ? Icons.check : Icons.close, color: isValid ? AppColors.green : AppColors.red, size: 18),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(color: isValid ? AppColors.green : AppColors.red),
        ),
      ],
    );
  }
}
