import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:v_bhartiya/user_pages/user_bottom_navigation_screen.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}
class _OtpState extends State<Otp> {
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  String strFormatting(n) => n.toString().padLeft(2, '0');
  void verifyButtonfunction() {
    final otp = txt1.text + txt2.text + txt3.text + txt4.text;
    clearOtp();

    if (otp == '0000') {
      stopTimer();
      Get.off(MainScreenUser(),transition: Transition.upToDown, duration: const Duration(seconds: 1));
    } else {
      setState(() {
        invalidOtp = true;
      });
    }
  }

  void clearOtp(){
    txt1.text = '';
    txt2.text = '';
    txt3.text = '';
    txt4.text = '';
  }

  void resendOtpFun(){
    invalidOtp = false;
    resendTime = 60;
    startTimer();
    clearOtp();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    String imagePath = isDarkTheme
        ? 'assets/onboarding/Otp_dark.png'
        : 'assets/onboarding/Otp.png';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Verification',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            fontSize: 25
          ),),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(imagePath, width: 250, height: 250,),
                Text(
                  'Verification Code',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onPrimary),
                ),
                const SizedBox(height: 20),
                Text(
                  'Enter the 4 digit verification code received',
                  style: TextStyle(fontSize: 15,color: Theme.of(context).colorScheme.onPrimary),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myInputBox(context, txt1),
                    myInputBox(context, txt2),
                    myInputBox(context, txt3),
                    myInputBox(context, txt4),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haven't received OTP yet?",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(width: 10),
                    resendTime == 0
                        ? InkWell(
                      onTap: () {
                        resendOtpFun();
                        //
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.error),
                      ),
                    )
                        : const SizedBox()
                  ],
                ),
                const SizedBox(height: 10),
                resendTime != 0
                    ? Text(
                  'You can resend OTP after ${strFormatting(resendTime)} second(s)',
                  style: TextStyle(fontSize: 10,color: Theme.of(context).colorScheme.onPrimary),
                )
                    : const SizedBox(),
                const SizedBox(height: 5),
                Text(
                  invalidOtp ? 'Invalid otp!' : '',
                  style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.error),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    verifyButtonfunction();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    'Verify',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 70,
    width: 60,
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 7, left: 5),
        child: TextField(
          controller: controller,
          maxLength: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 42, color: Theme.of(context).colorScheme.onPrimary),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
        ),
      ),
    ),
  );


  // @override
  // Widget build(BuildContext context) {
  //   final defaultPinTheme = PinTheme(
  //     width: 56,
  //     height: 56,
  //     textStyle: TextStyle(
  //         fontSize: 20,
  //         color: Color.fromRGBO(30, 60, 87, 1),
  //         fontWeight: FontWeight.w600),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //   );
  //
  //   final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  //     border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  //     borderRadius: BorderRadius.circular(8),
  //   );
  //
  //   final submittedPinTheme = defaultPinTheme.copyWith(
  //     decoration: defaultPinTheme.decoration?.copyWith(
  //       color: Color.fromRGBO(234, 239, 243, 1),
  //     ),
  //   );
  //
  //   void appBarIconButtonFun(){
  //       Get.back();
  //   }
  //
  //   void verifyNumFun(){
  //
  //   }
  //
  //   void editPhoneNumFun() {
  //     Get.back();
  //   }
  //
  //
  //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: Color.fromRGBO(64,123,255,1),
  //   ));
  //   return Scaffold(
  //     appBar: AppBar(
  //       leading: IconButton(
  //         onPressed: () {
  //           appBarIconButtonFun();
  //         },
  //         icon: Icon(
  //           Icons.arrow_back_ios_rounded,
  //           color: Colors.black,
  //         ),
  //       ),
  //       elevation: 0,
  //     ),
  //     body: Container(
  //       margin: EdgeInsets.only(left: 25, right: 25),
  //       alignment: Alignment.center,
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Image.asset(
  //               'assets/onboarding/Otp.png',
  //               width: 250,
  //               height: 250,
  //             ),
  //             SizedBox(
  //               height: 25,
  //             ),
  //             Text(
  //               "Phone Verification",
  //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             const Text(
  //               "To proceed with your account setup, please verify your phone number!",
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(
  //               height: 30,
  //             ),
  //             Pinput(
  //               length: 5,
  //               // defaultPinTheme: defaultPinTheme,
  //               // focusedPinTheme: focusedPinTheme,
  //               // submittedPinTheme: submittedPinTheme,
  //
  //               showCursor: true,
  //               onCompleted: (pin) => print(pin),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             SizedBox(
  //               width: double.infinity,
  //               height: 45,
  //               child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color.fromRGBO(64,123,255,0.7),
  //                       shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(10))),
  //                   onPressed: () {
  //                     verifyNumFun();
  //                   },
  //                   child: const Text("Verify Phone Number", style: TextStyle(color: Colors.white),)),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 TextButton(
  //                     onPressed: () {
  //                       editPhoneNumFun();
  //                     },
  //                     child: Center(
  //                       child: const Text(
  //                         "Edit Phone Number ?",
  //                         style: TextStyle(color: Colors.black),
  //                       ),
  //                     ))
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
