// import 'dart:html';
// //import 'package:pdf_viewer_example/api/pdf_api.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class PDFApi {
//   static Future<File> loadNetwork(String url) async {
//     final response = await http.get(url);
//     final bytes = response.bodyBytes;
//
//     return _storeFile(url, bytes);
//
//   }
//
//   static Future<File> _storeFile(String url, List<int> bytes) async {
//     final filename = basename(url);
//     final dir = await getApplicationDocumentsDirectory();
//
//     final file = File('${dir.path}/$filename');
//     await file.writeAsBytes(bytes, flush:true);
//     return file;
//   }
//
// }