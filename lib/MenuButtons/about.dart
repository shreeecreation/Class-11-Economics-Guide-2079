// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ShreeeCreation",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        SizedBox(height: 40),
        SizedBox(
            child: Text(
          "The Shree Creation is a individual software company which develops a software that helps to create a better world for tommorrow. Developed the software like FaceNepal(Rapper), Class 11 Economics Guide and many more to come.",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Georgia",
          ),
          textAlign: TextAlign.center,
        )),
        SizedBox(height: 40),
        SizedBox(
            height: 110,
            child: Text(
              "If you have any suggestions regarding our service in any software please consider giving feedback. We will looking for your response so that we can improve our service.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )),
        const SizedBox(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              " \n Most of the notes are from the books and some of them are from online resources. Not all the notes belongs to the developer of this app.\n If you have any suggestions or feedbacks, please message to us at shreeecreation720@gmail.com ",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ));
  }
}
