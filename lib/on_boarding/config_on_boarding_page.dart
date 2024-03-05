import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v_bhartiya/authantication/login_or_signup_page.dart';
import 'package:v_bhartiya/on_boarding/on_boarding_page_1.dart';
import 'package:v_bhartiya/on_boarding/on_boarding_page_2.dart';
import 'package:v_bhartiya/on_boarding/on_boarding_page_3.dart';
import 'package:v_bhartiya/on_boarding/on_boarding_page_4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:v_bhartiya/on_boarding/style_on_boarding_page.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_bhartiya/theme/themes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast=false;
  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).colorScheme.primary,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 15,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
                onPageChanged: (int val){
                  if(val==3){
                    isLast=true;
                  }else{
                    isLast=false;
                  }
                  setState(() {isLast;});
                },
              controller: controller,
                children: const [
                  PageOne(),
                  PageTwo(),
                  PageThree(),
                  PageFour()
                ],
            ),
          ),
          Align(
            alignment: const Alignment(0,0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!isLast) InkWell(
                  onTap: (){
                    controller.jumpToPage(3);
                  },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Center(
                          child: Text('Skip', style: TextStyleIs().skip_and_next(context)),
                        ),
                      ),
                    )
                )
                else Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Center(
                      child: Text('Skip', style: TextStyle(color: Theme.of(context).colorScheme.background)),
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: ScrollingDotsEffect(
                    dotColor: Theme.of(context).colorScheme.primary,
                    activeDotColor: Theme.of(context).colorScheme.onPrimary,
                    fixedCenter: true,
                      dotWidth: 7,
                    activeDotScale: 1.1,
                    dotHeight: 7
                  ),
                ),
                if (!isLast) InkWell(
                  onTap: (){
                    controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                  },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Center(
                          child: Text('Next', style: TextStyleIs().skip_and_next(context)),
                        ),
                      ),
                    ))
                else InkWell(
                  onTap: (){
                    Get.off(const LoginOrSignUpAsking(), transition: Transition.zoom, duration: const Duration(seconds: 1));
                  }, child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18, left: 18),
                    child: Center(
                      child: Text('Done', style: TextStyleIs().skip_and_next(context)),
                    ),
                  ),
                ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              'assets/onboarding/wave.svg',
              color: Theme.of(context).colorScheme.primary,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}