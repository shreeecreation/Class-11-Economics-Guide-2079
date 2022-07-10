// ignore_for_file: deprecated_member_use
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eco/Intro/homepage.dart';
import 'package:flutter/material.dart';

import '../internet.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  bool isoffline = false;
  Connectivity connectivity = Connectivity();
  late StreamSubscription subscription;
  // ignore: non_constant_identifier_names
  void CheckRealTime() {
    subscription = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        isoffline = true;
        setState(() {});
      } else if (event == ConnectivityResult.wifi) {
        isoffline = true;
        setState(() {});
      } else {
        isoffline = false;
        setState(() {});
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    CheckRealTime();
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isoffline
        ? Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Card(
                      color: Colors.white54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(height: 5),
                          Center(
                              child: Text("Grade 11",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: 4),
                          Text("Economics",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("Management",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                          Center(
                              child: Text("Guide and Past Questions",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45))),
                          Center(
                              child: Text("Based on New Curriculum",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45))),
                          Center(
                              child: Text("(TU Affiliated)",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45))),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: const Color.fromARGB(255, 15, 147, 255),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      (Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Home())));
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 240, 230, 230),
                      size: 35,
                    ),
                  ),
                )
              ],
            ),
          )
        : Internet();
  }
}
