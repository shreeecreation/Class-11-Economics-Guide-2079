// ignore_for_file: camel_case_types

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eco/Intro/Chapter_Data_Page.dart';
import 'package:eco/Intro/futureMain.dart';
import 'package:eco/Intro/intro.dart';
import 'package:eco/Intro/pastquestions.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Intro/future.dart';
import '../Intro/homepage.dart';
import '../MenuButtons/about.dart';
import '../internet.dart';

class router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => AnimatedSplashScreen(
                  splash: SizedBox(
                    // color: Colors.black12,
                    // width: MediaQuery.of().size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/image/Class 11 Economics.png',
                            height: 180, width: 160),
                        const SizedBox(height: 40),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                  duration: 3000,
                  splashIconSize: double.maxFinite,
                  pageTransitionType: PageTransitionType.fade,
                  nextScreen: const Intro(),
                ));
      case "home":
        return MaterialPageRoute(builder: (_) => const Home());
      case "internet":
        return MaterialPageRoute(builder: (_) => Internet());
      case "about":
        return MaterialPageRoute(builder: (_) => const AboutUs());
      case "main":
        return MaterialPageRoute(builder: (_) => const FUtureBulder());
      case "mainpage":
        return MaterialPageRoute(builder: (_) => const FutureMan());
      case "past":
        return MaterialPageRoute(builder: (_) => const PastQuestions());
      case "data":
        final args = settings.arguments as Capter_Data;
        return MaterialPageRoute(
            builder: (_) => Capter_Data(Textlink: args.Textlink));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
