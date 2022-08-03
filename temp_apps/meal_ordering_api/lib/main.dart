import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:meal_ordering_api/screens/home.dart';
import 'package:meal_ordering_api/screens/myhome.dart';

void main() {
  runApp(GetMaterialApp(
    home: AnimatedSplashScreen(

      splash: Image.asset('assits/images/food_icon.jpg'),
      nextScreen: MyHome(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
