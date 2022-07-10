// ignore_for_file: library_prefixes, deprecated_member_use, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Chapter_Data_Page.dart';
import 'model.dart';

class FUtureBulder extends StatefulWidget {
  const FUtureBulder({Key? key}) : super(key: key);

  @override
  State<FUtureBulder> createState() => _FUtureBulderState();
}

class _FUtureBulderState extends State<FUtureBulder> {
  @override
  void initState() {
    initAd();

    super.initState();
  }

  late InterstitialAd interstital;

  bool isAdloaded = false;
  late bool chekingInternetConnection;

  late int _textlink;
  void initAd() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-2610940733433953/7118556393",
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: (error) {},
        ));
  }

  onAdLoaded(InterstitialAd ad) {
    interstital = ad;
    isAdloaded = true;
    interstital.fullScreenContentCallback =
        FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
      interstital.dispose();
      isAdloaded = false;
      Navigator.pushNamed(context, "data",
          arguments: Capter_Data(Textlink: _textlink));
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      interstital.dispose();
      isAdloaded = false;
      Navigator.pushNamed(context, "data",
          arguments: Capter_Data(Textlink: _textlink));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            //in case if error found
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<Eco_Model>;
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true, // calling the neverscrollable functio here
                scrollDirection: Axis.vertical,
                // ignore: unnecessary_null_comparison
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: SingleChildScrollView(
                      child: GestureDetector(
                        onTap: () async {
                          var textlink;
                          switch (index) {
                            case 0:
                              textlink = 0;
                              _textlink = textlink;

                              break;
                            case 1:
                              textlink = 1;
                              _textlink = textlink;

                              break;
                            case 2:
                              textlink = 2;
                              _textlink = textlink;
                              break;
                            case 3:
                              textlink = 3;
                              _textlink = textlink;
                              break;
                            case 4:
                              textlink = 4;
                              _textlink = textlink;
                              break;
                          }
                          try {
                            final result = await InternetAddress.lookup(
                                'www.facebook.com');
                            if (result.isNotEmpty &&
                                result[0].rawAddress.isNotEmpty) {
                              chekingInternetConnection = true;
                            }
                          } on SocketException catch (_) {
                            chekingInternetConnection = false;
                          }
                          if (chekingInternetConnection) {
                            if (isAdloaded) {
                              interstital.show();
                            } else {
                              Navigator.pushNamed(context, "data",
                                  arguments: Capter_Data(Textlink: textlink));
                            }
                          } else {
                            Navigator.pushNamed(context, "data",
                                arguments: Capter_Data(Textlink: textlink));
                          }
                        },
                        child: SizedBox(
                          height: 80,
                          child: Card(
                            color: Colors.white,
                            // elevation: 0.2,

                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 25),
                              child: Text(
                                  ("${index + 1}. ${items[index].name}"),
                                  style: const TextStyle(fontSize: 18)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            // show circular progress while data is getting fetched from json file
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

// ignore: non_constant_identifier_names
Future<List<Eco_Model>> ReadJsonData() async {
  //read json file
  final jsondata = await rootBundle.rootBundle.loadString("assets/eco.json");
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => Eco_Model.fromJson(e)).toList();
}
