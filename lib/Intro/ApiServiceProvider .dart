// ignore_for_file: import_of_legacy_library_into_null_safe, file_names

import 'dart:io';

// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ApiServiceProvider {
  static Future<String> loadPDF(String url) async {
    var response = await http.get(url);

    var dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/data.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }

  static Future<String> fromAsset(String asset) async {
    var response = await rootBundle.rootBundle.load(asset);
    var dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/data.pdf");
    var bytes = response.buffer.asUint8List();
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }
}
