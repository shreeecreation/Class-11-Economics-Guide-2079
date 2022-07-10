// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Internet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Oops ! No internet connection",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        SizedBox(
            height: MediaQuery.of(context).size.height / 2.9,
            child: Center(child: Image.asset("assets/image/internet.png"))),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.restorablePushReplacementNamed(context, "home");
                    },
                    child: Text("Go offline!",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 12)),
                  ),
                ),
              ],
            )),
        SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Note:\n If you're offline then you can't access some of the features of this application. Try going online !",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ))
      ]),
    );
  }
}
