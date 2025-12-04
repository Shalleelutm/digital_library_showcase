import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/bottom_nav.dart';
import 'book_details_screen.dart';
import 'categories_screen.dart';

class BooksScreen extends StatelessWidget {
  final String categoryName;
  final String pdfPath;
  final String image;
  final String description;

  const BooksScreen({
    super.key,
    required this.categoryName,
    required this.pdfPath,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    const String defaultAuthor = 'Unknown Author';

    final book = Book(
      title: categoryName,
      author: defaultAuthor,
      image: image,
      pdf: pdfPath,
      category: categoryName,
      description: description,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('$categoryName Books'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/library_banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    color: const Color.fromARGB(180, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 8,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(18),
                            bottomLeft: Radius.circular(18),
                          ),
                          child: Image.asset(
                            image,
                            height: 140,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categoryName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  description,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              image,
                              height: 50,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            book.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(book.description),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookDetailsScreen(book: book),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNav(
          showPrevious: true,
          showNext: true,
          onPrevious: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const CategoriesScreen()),
            );
          },
          onNext: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BookDetailsScreen(book: book),
              ),
            );
          },
        ));
  }
}
