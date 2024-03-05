import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v_bhartiya/authantication/login_page.dart';
import 'package:v_bhartiya/authantication/sign_up_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginOrSignUpAsking extends StatefulWidget {
  const LoginOrSignUpAsking({super.key});

  @override
  State<LoginOrSignUpAsking> createState() => _LoginOrSignUpAskingState();
}

void logInfun(){
  Get.to(const Login(),transition: Transition.downToUp, duration: const Duration(milliseconds: 500));
}

void signUpfun(){
  Get.to(const SignUpScreen(),transition: Transition.downToUp, duration: const Duration(milliseconds: 500));
}

class _LoginOrSignUpAskingState extends State<LoginOrSignUpAsking> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).colorScheme.primary,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 15, // Adjust the height as needed
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).colorScheme.background,
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: SizedBox(
                      width: 350,
                        height: 350,
                        child: Lottie.asset('assets/onboarding/welcome1.json', reverse: true)),
                  ),
                  const SizedBox(height: 90,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.85,
                        53,
                      ), backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0, // Remove elevation (shadow) effect
                    ),
                    onPressed: () {
                      logInfun();
                    },
                    child: const Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login, color: Colors.white,),
                          SizedBox(width: 12,),
                          Text('SIGN IN',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto'
                          ),),
                        ],
                      ),
                  ),
                  ),
                  const SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      signUpfun();
                    },
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.85,
                          53,
                        ), backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0, // Remove elevation (shadow) effect
                      ),
                      onPressed: () {
                        signUpfun();
                      },
                      child: const Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.supervisor_account, color: Colors.white,),
                          SizedBox(width: 12,),
                          Text('SIGN UP',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto'
                          ),),
                        ],
                      ),
                      ),
                    ),
                  ),
                ]
            ),
          ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: SvgPicture.asset(
          //     'assets/onboarding/wave.svg',
          //     width: MediaQuery.of(context).size.width,
          //   ),
          // ),
        ],
      ),
    );
  }
}
