// ignore_for_file: prefer_const_constructors, deprecated_member_use, file_names

import 'package:eco/Intro/future.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:open_store/open_store.dart';
import 'package:url_launcher/url_launcher.dart';

class FutureMan extends StatefulWidget {
  const FutureMan({Key? key}) : super(key: key);

  @override
  State<FutureMan> createState() => _FutureManState();
}

class _FutureManState extends State<FutureMan> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("    Economics"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              Share.share(
                  "https://play.google.com/store/apps/details?id=com.kiddiecreation.eco");
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.star,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              OpenStore.instance.open(
                appStoreId: '6976457989987248219',
                androidAppBundleId: 'com.kiddiecreation.fnRapper',
              );
            },
          ),
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Privacy Policy"),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text("About Us"),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text("More Apps"),
              ),
            ];
          }, onSelected: (value) async {
            if (value == 0) {
              if (await canLaunch(
                  "https://sites.google.com/view/class11ecopolicy/home")) {
                await launch(
                    "https://sites.google.com/view/class11ecopolicy/home");
              }
            } else if (value == 1) {
              Navigator.pushNamed(context, "about");
            } else if (value == 2) {
              if (await canLaunch(
                  "https://play.google.com/store/apps/developer?id=Shreee_Creation")) {
                await launch(
                    "https://play.google.com/store/apps/developer?id=Shreee_Creation");
              }
            }
          }),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Card(
                      elevation: 0.0,
                      color: Colors.transparent,
                      child: Image.asset("assets/image/class11internal2.png",
                          height: 300, width: 160)))),
          const SizedBox(height: 5),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text("   Chapters",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
          const SizedBox(height: 5),
          const FUtureBulder(),
        ])),
      ),
    );
  }
}
