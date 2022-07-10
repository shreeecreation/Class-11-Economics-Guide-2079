// ignore_for_file: camel_case_types, non_constant_identifier_names, library_prefixes, prefer_typing_uninitialized_variables, must_be_immutable, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../AdHelper.dart';

import 'ApiServiceProvider .dart';

class Capter_Data extends StatefulWidget {
  var Textlink;
  Capter_Data({Key? key, required this.Textlink}) : super(key: key);

  @override
  State<Capter_Data> createState() => _Capter_DataState();
}

class _Capter_DataState extends State<Capter_Data> {
  var textfile = "";
  var localPath;
  final AdWidget adWidget = AdWidget(ad: AdHelper.myBanner2);

  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  var switching;
  var path;
  @override
  void initState() {
    AdHelper.myBanner2.load();

    switching = widget.Textlink;
    switch (widget.Textlink) {
      case 0:
        path = "assets/eco_chap_1_compressed.pdf";
        break;
      case 1:
        path = "assets/eco_chap_2.pdf";
        break;
      case 2:
        path = "assets/eco_chap_3.pdf";
        break;
      case 3:
        path = "assets/eco_chap_4.pdf";
        break;
      case 4:
        path = "assets/eco_chap_5.pdf";
        break;
    }
    ApiServiceProvider.fromAsset(path).then((value) {
      setState(() {
        localPath = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final text = '${indexPage + 1} of $pages';
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: const Text("Economics Guide"),
          actions: pages >= 2
              ? [
                  Center(child: Text(text)),
                  IconButton(
                    icon: const Icon(Icons.chevron_left, size: 32),
                    onPressed: () {
                      final page = indexPage == 0 ? pages : indexPage - 1;
                      controller.setPage(page);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, size: 32),
                    onPressed: () {
                      final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                      controller.setPage(page);
                    },
                  ),
                ]
              : null,
        ),
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.transparent,
          child: adWidget,
        ),
        body: localPath != null
            ? SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: PDFView(
                        nightMode: true,
                        fitEachPage: true,
                        autoSpacing: true,
                        filePath: localPath,
                        pageFling: false,
                        pageSnap: false,
                        // swipeHorizontal: true,
                        // enableSwipe: true,
                        // fitPolicy: FitPolicy.BOTH,
                        onRender: (pages) =>
                            setState(() => this.pages = pages!),
                        onViewCreated: (controller) =>
                            setState(() => this.controller = controller),
                        onPageChanged: (indexPage, _) =>
                            setState(() => this.indexPage = indexPage!),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
