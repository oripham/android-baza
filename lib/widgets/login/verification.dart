import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../../core/design_systems/theme/app_colors.dart';
import '../../core/navigations/routers.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool isPhoneEntered = false;
  bool isPhoneOTPEntered = false;
  final TextEditingController phoneController = TextEditingController();
  final List<TextEditingController> emailOtpControllers = List.generate(4, (_) => TextEditingController());
  final List<TextEditingController> phoneOtpControllers = List.generate(4, (_) => TextEditingController());

  void handleContinue() {
    if (isPhoneOTPEntered) {
      BazarRouter.router.navigateTo(
        context,
        '/success?type=1',
        transition: TransitionType.inFromRight,
      );
    } else if (isPhoneEntered) {
      setState(() {
        isPhoneOTPEntered = true;
      });
    } else {
      setState(() {
        isPhoneEntered = true;
      });
    }
  }

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
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                isPhoneOTPEntered
                    ? "Verification Phone"
                    : isPhoneEntered
                        ? "Phone Number"
                        : "Verification Email",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                isPhoneOTPEntered
                    ? "Please enter the code we just sent to phone number ${phoneController.text}"
                    : isPhoneEntered
                        ? "Please enter your phone number, so we can more easily deliver your order"
                        : "Please enter the code we just sent to email ${widget.email}",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              if (!isPhoneEntered) ...[
                const SizedBox(height: 5),
                Text(
                  widget.email,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
              const SizedBox(height: 20),
              if (isPhoneOTPEntered)
                _buildOtpFields(phoneOtpControllers, true)
              else if (isPhoneEntered)
                _buildPhoneInput()
              else
                _buildOtpFields(emailOtpControllers, false),
              const Spacer(),
              ElevatedButton(
                onPressed: handleContinue,
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

  Widget _buildOtpFields(List<TextEditingController> controllers, bool isPhone) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return SizedBox(
              width: 50,
              child: TextField(
                controller: controllers[index],
                keyboardType: TextInputType.none,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (value) {
                  if (value.length == 1 && index < 3) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => _buildCustomKeyboard(index, controllers),
                  );
                },
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("If you didn't receive a code? ", style: TextStyle(color: Colors.grey.shade600)),
              const Text("Resend", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Phone Number", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
        const SizedBox(height: 5),
        TextField(
          controller: phoneController,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            hintText: "Enter your phone number",
            prefixIcon: const Icon(Icons.phone, color: Colors.deepPurple),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => _buildCustomKeyboardForPhone(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCustomKeyboard(int index, List<TextEditingController> controllers) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          color: AppColors.white,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2.5),
                  itemBuilder: (context, i) {
                    String text;
                    if (i < 9) {
                      text = '${i + 1}';
                    } else if (i == 9) {
                      text = '';
                    } else if (i == 10) {
                      text = '0';
                    } else {
                      text = '⌫';
                    }
                    return GestureDetector(
                      onTap: () {
                        if (text == '⌫') {
                          if (controllers[index].text.isNotEmpty) {
                            controllers[index].clear();
                          } else if (index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        } else if (text.isNotEmpty) {
                          controllers[index].text = text;
                          if (index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        }
                        setState(() {});
                      },
                      child: Container(
                        color: AppColors.purple,
                        child: Center(
                          child: Text(text, style: const TextStyle(fontSize: 24, color: AppColors.white)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomKeyboardForPhone() {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          color: AppColors.white,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2),
                  itemBuilder: (context, i) {
                    String text;
                    if (i < 9) {
                      text = '${i + 1}';
                    } else if (i == 9) {
                      text = '';
                    } else if (i == 10) {
                      text = '0';
                    } else {
                      text = '⌫';
                    }
                    return GestureDetector(
                      onTap: () {
                        if (text == '⌫') {
                          if (phoneController.text.isNotEmpty) {
                            phoneController.clear();
                          }
                        } else if (text.isNotEmpty) {
                          phoneController.text += text;
                        }
                        setState(() {});
                      },
                      child: Container(
                        color: AppColors.purple,
                        child: Center(
                          child: Text(text, style: const TextStyle(fontSize: 24, color: AppColors.white)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}