import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/features/home/pres/homescrean.dart';
import 'package:movieapp/features/home/pres/widget/bottombar.dart';

class Splachscreanview extends StatelessWidget {
  const Splachscreanview({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splash: Lottie.asset('assets/netflix.json'),nextScreen:const BottomNavigation() ,
   
   splashIconSize: 400,
   duration: 2000, );
  }
}