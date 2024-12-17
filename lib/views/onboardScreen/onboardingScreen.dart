
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soulwhisper/constant/colors.dart';
import '../authScreen/loginScreen.dart';
import '../widgets/customButton1.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboarding1.svg',
      'title': 'Welcome to Soul Whisper',
      'description': 'Discover meaningful connections around you.',
    },
    {
      'image': 'assets/images/onboarding2.svg',
      'title': 'Personalized Matches',
      'description': 'Find matches based on your unique preferences.',
    },
    {
      'image': 'assets/images/onboarding3.svg',
      'title': 'Chat & Video Calls',
      'description': 'Interact in real-time to build genuine connections.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
        
            // AnimatedContainer
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingData.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: size.height * 0.01,
                  width: _currentPage == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColor.primaryColor
                        : AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
            // Image PageView Builder
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.02),
                      SvgPicture.asset(data['image']!, height: size.height * 0.6),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        data['title']!,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        data['description']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
        
                children: [     
                  // current index lenth is last screen then Navigator to login screen
                  _currentPage == onboardingData.length - 1
                      ?  CustomButton1(size: size,text: "Get Started",onPressed: (){
                        Get.off(()=>const LoginScreen());
                      },)
                      : GestureDetector(
                          onTap:() {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } ,
                          child: Container(
                            height: size.height*0.06,
                            width: size.width*0.8,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(28)
                            ),
                            child: const Center(child: Text("Continue",style: TextStyle(color: AppColor.backgrounColor,fontSize: 18),)),
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

