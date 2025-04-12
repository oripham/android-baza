import 'dart:async';
import 'package:bazar/blocs/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnBoardingBloc>(
      create: (context) => OnBoardingBloc(),
      child: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      image: 'assets/images/login-slide1.png',
      title: 'Now reading books\nwill be easier',
      description: 'Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
      buttonText: 'Continue',
    ),
    OnboardingItem(
      image: 'assets/images/login-slide2.png',
      title: 'Your Bookish Soulmate\nAwaits',
      description: 'Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
      buttonText: 'Get Started',
    ),
    OnboardingItem(
      image: 'assets/images/login-slide3.png',
      title: 'Start Your Adventure',
      description: 'Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let\'s go!',
      buttonText: 'Get Started',
    ),
  ];

  @override
  void initState() {
    super.initState();

    // Thêm listener cho PageController để theo dõi trang hiện tại
    _pageController.addListener(() {
      if (_pageController.page!.round() != _currentPage) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingBloc = Provider.of<OnBoardingBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h),
                child: TextButton(
                  onPressed: () {
                    // Navigate to the next screen
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFF5C3C98),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),

            // Slides
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingItems.length,
                itemBuilder: (context, index) {
                  return _buildOnboardingItem(onboardingItems[index]);
                },
              ),
            ),

            // Dot indicator
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: onboardingItems.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey.shade300,
                  activeDotColor: Color(0xFF5C3C98),
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  expansionFactor: 4,
                  spacing: 5.w,
                ),
              ),
            ),

            // Primary button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage < onboardingItems.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      // Navigate to the next screen when on the last page
                      Navigator.of(context).pushReplacementNamed('/login');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5C3C98),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    onboardingItems[_currentPage].buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            // Sign in button
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
              child: TextButton(
                onPressed: () {
                  // Navigate to sign in page
                  Navigator.of(context).pushNamed('/sign_in');
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingItem(OnboardingItem item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Image.asset(
                item.image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Title
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.2,
            ),
          ),
          SizedBox(height: 16.h),

          // Description
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;
  final String buttonText;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
  });
}