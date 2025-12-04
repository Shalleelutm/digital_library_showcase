import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'books_screen.dart';
import 'home_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, String>> categories = const [
    {
      "name": "Fiction",
      "image": "assets/books/fiction.jpg",
      "pdf": "assets/pdfs/fiction.pdf",
      "description": "Fiction stories with different themes.",
    },
    {
      "name": "Science",
      "image": "assets/books/ishan_science_book.jpeg",
      "pdf": "assets/pdfs/science_fingerprints.pdf",
      "description": "Ideas and discoveries in science.",
    },
    {
      "name": "Travel",
      "image": "assets/books/hemal_travel_guide.jpg",
      "pdf": "assets/pdfs/travel.pdf",
      "description": "Travel topics and locations.",
    },
    {
      "name": "History",
      "image": "assets/books/pride_and_prejudice.jpg",
      "pdf": "assets/pdfs/pride_and_prejudice.pdf",
      "description": "Historical events and people.",
    },
    {
      "name": "Engineering",
      "image": "assets/books/bhavish_engineering_book.jpeg",
      "pdf": "assets/pdfs/engineering.pdf",
      "description": "Engineering knowledge and practice.",
    },
    {
      "name": "Economics",
      "image": "assets/books/economics_book.jpg",
      "pdf": "assets/pdfs/economics_book.pdf",
      "description": "Economics and finance topics.",
    },
    {
      "name": "Physics",
      "image": "assets/books/ishan_science_book.jpeg",
      "pdf": "assets/pdfs/science.pdf",
      "description": "Physics theories and examples.",
    },
    {
      "name": "LinuxForFun",
      "image": "assets/books/linux_for_fun.jpg",
      "pdf": "assets/pdfs/linux_for_fun.pdf",
      "description": "Linux for learning and practice.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/categories_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.78,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BooksScreen(
                        categoryName: category["name"]!,
                        pdfPath: category["pdf"]!,
                        image: category["image"]!,
                        description: category["description"]!,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: AssetImage(category["image"]!),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(18),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      category["name"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(
        showPrevious: true,
        showNext: true,
        onPrevious: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        },
        onNext: () {
          final first = categories.first;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BooksScreen(
                categoryName: first["name"]!,
                pdfPath: first["pdf"]!,
                image: first["image"]!,
                description: first["description"]!,
              ),
            ),
          );
        },
      ),
    );
  }
}
