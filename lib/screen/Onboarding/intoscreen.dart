import 'package:e_learning/screen/Onboarding/circlurebar.dart';

import 'package:e_learning/utililts/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';

import 'package:shared_preferences/shared_preferences.dart';

class IntroScreenOnBoarding extends StatefulWidget {
  final List<Introduction> introductionList;
  final Color? backgroudColor;
  final Color? foregroundColor;
  final TextStyle? skipTextStyle;
  final Function()? onTapSkipButton;
  const IntroScreenOnBoarding({
    super.key,
    required this.introductionList,
    this.onTapSkipButton,
    this.backgroudColor,
    this.foregroundColor,
    this.skipTextStyle = const TextStyle(fontSize: 20),
  });

  @override
  _IntroScreenOnBoardingState createState() => _IntroScreenOnBoardingState();
}

class _IntroScreenOnBoardingState extends State<IntroScreenOnBoarding> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  double progressPercent = 0;
  bool isIntroSlider = false;
  final String isShowIntro = "sliders";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 550.0,
                      child: PageView(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: widget.introductionList,
                      ),
                    ),
                  ),
                  _customProgress(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customProgress() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CircleProgressBar(
            backgroundColor: Colors.black,
            foregroundColor: circlebar,
            value: ((_currentPage + 1) * 1.0 / widget.introductionList.length),
          ),
        ),
        Container(
          height: 55,
          width: 55,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: circlebar,
          ),
          child: IconButton(
            onPressed: () async {
              print("_currentPage $_currentPage");

              _currentPage != widget.introductionList.length - 1
                  ? _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    )
                  : widget.onTapSkipButton!();
              if (_currentPage == 3) {
                isIntroSlider = true;
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setString(isShowIntro, "skipIntro");

                String? showIntro = prefs.getString(isShowIntro);
                print("showIntro:: $showIntro");
              }
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            iconSize: 15,
          ),
        )
      ],
    );
  }
}
