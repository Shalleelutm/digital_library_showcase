import 'package:flutter/material.dart';
import 'book_details_screen.dart';

class BooksScreen extends StatelessWidget {
  final String categoryName;
  const BooksScreen({super.key, required this.categoryName});

  final Map<String, List<Map<String, String>>> categoryBooks = const {
    "Fiction": [
      {
        "title": "Fiction Book",
        "image": "assets/books/pride_and_prejudice.jpg",
        "pdf": "assets/pdfs/fiction.pdf"
      },
      {
        "title": "Science Fingerprints",
        "image": "assets/books/ishan_science_book.jpeg",
        "pdf": "assets/pdfs/science_fingerprints.pdf"
      },
    ],
    "Science": [
      {
        "title": "Science Book",
        "image": "assets/books/ishan_science_book.jpeg",
        "pdf": "assets/pdfs/science.pdf"
      },
    ],
    "Travel": [
      {
        "title": "Travel Guide",
        "image": "assets/books/hemal_travel_guide.jpg",
        "pdf": "assets/pdfs/travel.pdf"
      },
    ],
    "History": [
      {
        "title": "War and Peace",
        "image": "assets/books/war_and_peace.jpg",
        "pdf": "assets/pdfs/war_and_peace.pdf"
      },
    ],
    "Engineering": [
      {
        "title": "Engineering Book",
        "image": "assets/books/bhavish_engineering_book.jpeg",
        "pdf": "assets/pdfs/engineering.pdf"
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final books = categoryBooks[categoryName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookDetailsScreen(
                    title: book['title']!,
                    pdfPath: book['pdf']!,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.asset(book['image']!,
                      width: 100, height: 100, fit: BoxFit.cover),
                  const SizedBox(width: 16),
                  Text(book['title']!, style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
