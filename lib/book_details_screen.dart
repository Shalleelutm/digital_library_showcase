import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class BookDetailsScreen extends StatelessWidget {
  final String title;
  final String pdfPath;
  const BookDetailsScreen(
      {super.key, required this.title, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: PDFView(
        filePath: pdfPath,
      ),
    );
  }
}
