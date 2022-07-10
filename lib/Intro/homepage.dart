// ignore_for_file: constant_identifier_names, deprecated_member_use

import "package:flutter/material.dart";
import 'package:share_plus/share_plus.dart';
import 'package:open_store/open_store.dart';
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../AdHelper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextStyle textStyles = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  @override
  void initState() {
    AdHelper.myBanner.load();
    super.initState();
  }

  final AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);

  @override
  Widget build(BuildContext context) {
    const Point =
        "Don't Focus Too Much on Studying Only !!!\n \"EXPLORE,CREATE and FOLLOW YOUR PASSION\"";
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Share.share("www.google.com");
                },
              ),
              const Text("Home"),
            ],
          ),
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
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("About Us"),
                ),
                const PopupMenuItem<int>(
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
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.transparent,
          child: adWidget,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                  // height: 100,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.blue,
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 10),
                    child: Text(Point,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Raleway",
                          color: Colors.black,
                        )),
                  ))),
              SizedBox(
                  // height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    child: Card(
                        elevation: 0.0,
                        color: Colors.transparent,
                        child: Image.asset(
                          "assets/image/class11internal.png",
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width * 1.1,
                        )),
                  ))),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 4.2,
                          width: 130,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "mainpage");
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 5),
                                  Text("Chapter Guide",
                                      textAlign: TextAlign.center,
                                      style: textStyles),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(45),
                                      color: Colors.black,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  )
                                ],
                              ))),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 4.2,
                          width: 130,
                          child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  final result = await InternetAddress.lookup(
                                      'www.facebook.com');
                                  if (result.isNotEmpty &&
                                      result[0].rawAddress.isNotEmpty) {
                                    Navigator.pushNamed(context, "past");
                                  }
                                } on SocketException catch (_) {
                                  Navigator.pushReplacementNamed(
                                      context, "internet");
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 5),
                                  Text("Past Questions",
                                      textAlign: TextAlign.center,
                                      style: textStyles),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(45),
                                      color: Colors.black,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  )
                                ],
                              ))),
                    ],
                  ),
                  const SizedBox(width: 30),
                ],
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              const SizedBox(
                child: Text(
                  "Note:- \nFeel free to feedback on shreeecreation720@gmail.com",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontFamily: "Raleway", color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> _onBackButtonPressed(BuildContext context) async {
  bool? exitapp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Time to Study "),
          content: const Text("Do you sure want to close the app ?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No")),
          ],
        );
      });
  return exitapp ?? false;
}

//shreeecreation720 flutterdeveloper