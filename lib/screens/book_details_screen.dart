import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

import '../models/book.dart';
import '../widgets/bottom_nav.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;
  const BookDetailsScreen({super.key, required this.book});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  String? localPath;
  bool loading = true;

  PDFViewController? pdfController;
  int totalPages = 0;
  int currentPage = 0;
  final TextEditingController pageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    preparePdf();
  }

  Future<void> preparePdf() async {
    try {
      final bytes = await rootBundle.load(widget.book.pdf);
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/${widget.book.pdf.split('/').last}');
      await file.writeAsBytes(bytes.buffer.asUint8List());
      if (!mounted) return;
      setState(() {
        localPath = file.path;
        loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error opening PDF: $e')));
    }
  }

  void jumpToPage() {
    if (pdfController == null || totalPages == 0) return;
    final raw = pageController.text.trim();
    if (raw.isEmpty) return;
    final desired = int.tryParse(raw);
    if (desired == null) return;
    final pageIndex = desired - 1;
    if (pageIndex < 0 || pageIndex >= totalPages) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Page must be between 1 and $totalPages')),
      );
      return;
    }
    pdfController!.setPage(pageIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(book.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(12),
                child: Text(
                  '${book.author} • ${book.category}',
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              book.description,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Go to page',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    onSubmitted: (_) => jumpToPage(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: jumpToPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent.shade700,
                  ),
                  child: const Text(
                    'Go',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 12),
                if (totalPages > 0) Text('$currentPage / $totalPages'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : (localPath == null
                    ? const Center(child: Text('Unable to open PDF.'))
                    : PDFView(
                        filePath: localPath,
                        enableSwipe: true,
                        swipeHorizontal: true,
                        autoSpacing: true,
                        pageSnap: true,
                        onViewCreated: (controller) {
                          setState(() {
                            pdfController = controller;
                          });
                        },
                        onRender: (pages) {
                          setState(() {
                            totalPages = pages ?? 0;
                            currentPage = totalPages > 0 ? 1 : 0;
                          });
                        },
                        onPageChanged: (page, total) {
                          setState(() {
                            currentPage = (page ?? 0) + 1;
                            totalPages = total ?? totalPages;
                          });
                        },
                      )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(
        showPrevious: true,
        showNext: true,
        onPrevious: () {
          Navigator.of(context).pop();
        },
        onNext: () {
          Navigator.of(context).popUntil(
              (route) => route.settings.name == 'home' || route.isFirst);
        },
      ),
    );
  }
}
