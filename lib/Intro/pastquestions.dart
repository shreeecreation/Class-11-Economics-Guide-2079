// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'ApiServiceProvider .dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PastQuestions extends StatefulWidget {
  const PastQuestions({Key? key}) : super(key: key);

  @override
  State<PastQuestions> createState() => _PastQuestionsState();
}

class _PastQuestionsState extends State<PastQuestions> {
  final FB_link = [
    "https://firebasestorage.googleapis.com/v0/b/class11eco-3a9d0.appspot.com/o/eco.pdf?alt=media&token=0da06e0b-b8a6-41e5-ace5-6426b35e5baa",
    "https://firebasestorage.googleapis.com/v0/b/class11eco-3a9d0.appspot.com/o/eco2.pdf?alt=media&token=252f8ad5-b903-471d-9d97-acadfe1e08ff",
    "https://firebasestorage.googleapis.com/v0/b/class11eco-3a9d0.appspot.com/o/eco.pdf?alt=media&token=da43661e-44f5-4e1d-b085-a988c69675b7",
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      const Questions(),
      const Questions1(),
      const Questions2(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      // backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white38,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.one_k),
            label: 'First Terminal',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_k),
            label: 'Second Terminal',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.three_k),
            label: 'Final Terminal',
            backgroundColor: Colors.cyan,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

class Questions extends StatelessWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Questions_Model(
          link:
              "https://firebasestorage.googleapis.com/v0/b/class11eco-3a9d0.appspot.com/o/eco.pdf?alt=media&token=0da06e0b-b8a6-41e5-ace5-6426b35e5baa"),
    );
  }
}

class Questions1 extends StatelessWidget {
  const Questions1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Questions_Model(
        link:
            "https://firebasestorage.googleapis.com/v0/b/class11eco-3a9d0.appspot.com/o/eco2.pdf?alt=media&token=252f8ad5-b903-471d-9d97-acadfe1e08ff");
  }
}

class Questions2 extends StatelessWidget {
  const Questions2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Questions_Model(
        link:
            "https://firebasestorage.googleapis.com/v0/b/class11eco-3a9d0.appspot.com/o/ecofinal.pdf?alt=media&token=51301157-9af8-4898-9e0f-314fec3397ef");
  }
}

class Questions_Model extends StatefulWidget {
  var link;
  Questions_Model({Key? key, required this.link}) : super(key: key);

  @override
  State<Questions_Model> createState() => _Questions_ModelState();
}

class _Questions_ModelState extends State<Questions_Model> {
  var textfile = "";
  var localPath;
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  @override
  void initState() {
    super.initState();

    ApiServiceProvider.loadPDF(widget.link).then((value) {
      setState(() {
        localPath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = '${indexPage + 1} of $pages';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Economics"),
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
      body: localPath != null
          ? PDFView(
              nightMode: true,
              fitEachPage: false,
              autoSpacing: false,
              filePath: localPath,
              // pageFling: true,
              // pageSnap: true,
              // swipeHorizontal: true,
              enableSwipe: true,
              // fitPolicy: FitPolicy.BOTH,
              onRender: (pages) => setState(() => this.pages = pages!),
              onViewCreated: (controller) =>
                  setState(() => this.controller = controller),
              onPageChanged: (indexPage, _) =>
                  setState(() => this.indexPage = indexPage!),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
