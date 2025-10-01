import 'package:delvirick/core/utils/consts/colors.dart';
import 'package:delvirick/core/utils/consts/fonts.dart';
import 'package:delvirick/core/utils/consts/imgs.dart';
import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:delvirick/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": ConstImgs.onboarding1,
      "title": "Find your Comfort Food here",
      "subtitle":
          "Here You Can find a chef or dish for every taste and color. Enjoy!",
    },
    {
      "image": ConstImgs.onboarding2,
      "title": "Deliver is Where Your Comfort Food Lives",
      "subtitle": "Enjoy a fast and smooth food delivery at your doorstep",
    },
    {
      "image": ConstImgs.onboarding3,
      "title": "Order & Enjoy Fast Delivery",
      "subtitle":
          "From our kitchen to your doorstep fast, fresh, and always on time",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                            onboardingData[index]["image"]!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          onboardingData[index]["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: hight * 0.1),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => Container(
                  margin: const EdgeInsets.all(4),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index
                            ? Colors.green
                            : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            SizedBox(height: hight * 0.05),

            // Next Button
            CustomButton(
              onpress: () {
                if (_currentPage == onboardingData.length - 1) {
                  GoRouter.of(context).push(Routers.userscreen);
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              title: "Next",
            ),

            SizedBox(height: hight * 0.1),
          ],
        ),
      ),
    );
  }
}
