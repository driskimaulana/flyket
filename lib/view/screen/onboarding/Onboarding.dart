import 'package:flutter/material.dart';
import 'package:flyket/model/onboarding/OnboardingItem.dart';
import 'package:flyket/view/screen/home/home_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    backgroundColor: const Color.fromARGB(255, 2, 137, 155),
  );

  int currentIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int i) {
                  setState(() {
                    currentIndex = i;
                  });
                },
                itemCount: onBoardingItems.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(60),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          onBoardingItems[i].image,
                          height: 200,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          onBoardingItems[i].title,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 2, 114, 129),
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          onBoardingItems[i].subtitle,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onBoardingItems.length, (i) {
                return buildDot(i, context);
              }),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                if (currentIndex == onBoardingItems.length - 1) {
                  Navigator.pushNamed(context, "/login");
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => HomeScreen()),
                  // );
                }

                _pageController.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              style: flatButtonStyle,
              child: currentIndex == onBoardingItems.length - 1
                  ? const Text("Login")
                  : const Text("Next"),
            ),
          ),
          currentIndex == onBoardingItems.length - 1
              ? TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                )
              : const SizedBox(
                  width: 0,
                ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 2, 137, 155),
      ),
    );
  }
}
