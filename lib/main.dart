import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_bhartiya/theme/themes.dart';
import 'authantication/login_or_signup_page.dart';
import 'on_boarding/config_on_boarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstRun = prefs.getBool('first_run') ?? true;

  runApp(GetMaterialApp(
    home: isFirstRun ? const OnBoardingScreen() : const LoginOrSignUpAsking(),
    debugShowCheckedModeBanner: false,
    theme: lightTheme,
    darkTheme: darkTheme,
    i letrally fucked up
  ));
}