import 'dart:io';
import 'package:bicjr_app/views/pages/pdf_viewer/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class LaunchFile {
  
  static void launchPDF(
      BuildContext context, String title, String pdfPath, String pdfUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(title, pdfPath, pdfUrl),
      ),
    );
  }

  static Future<dynamic> createFileFromPdfUrl(dynamic url) async {
    final filename = 'flutterSlides.pdf';

    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
}