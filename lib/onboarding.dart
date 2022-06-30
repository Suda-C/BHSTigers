import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'nav_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            Container(
              color: Colors.red,
              child: Center(child: Text('1'),),
            ),

            Container(
              color: Colors.blue,
              child: Center(child: Text('2'),),
            ),

            Container(
              color: Colors.green,
              child: Center(child: Text('3'),),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage?
          TextButton(
            child: const Text('Get Started'),
            onPressed: () async {

              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', true);

              Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Home3Page()));
            },
          ):

      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            TextButton(
                onPressed: () => controller.jumpToPage(2),
                child: Text('Skip'),
            ),

            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700
                ),
                onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),


              ),
            ),

            TextButton(
              onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOut),
              child: Text('Next'),
            ),

          ],
        ),
      ),
    );
  }
}
