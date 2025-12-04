import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'welcome_screen.dart';
import 'categories_screen.dart';
import 'books_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Map<String, String>> allBooks = [
    {
      "name": "Fiction",
      "image": "assets/books/fiction.jpg",
      "pdf": "assets/pdfs/fiction.pdf",
      "description":
          "The Stories along with the imagined characters and their respective events.",
    },
    {
      "name": "Science",
      "image": "assets/books/ishan_science_book.jpeg",
      "pdf": "assets/pdfs/science_fingerprints.pdf",
      "description": "Our Scientific ideas and experimental simulations.",
    },
    {
      "name": "Travel",
      "image": "assets/books/hemal_travel_guide.jpg",
      "pdf": "assets/pdfs/travel.pdf",
      "description":
          "The full Guide to travelling and finding out new heights and horizons.",
    },
    {
      "name": "History",
      "image": "assets/books/pride_and_prejudice.jpg",
      "pdf": "assets/pdfs/pride_and_prejudice.pdf",
      "description": "Historical eras and auto-biographies.",
    },
    {
      "name": "Engineering",
      "image": "assets/books/bhavish_engineering_book.jpeg",
      "pdf": "assets/pdfs/engineering.pdf",
      "description":
          "Amazing engineering skills and virtualisation techniques.",
    },
    {
      "name": "Physics",
      "image": "assets/books/ishan_science_book.jpeg",
      "pdf": "assets/pdfs/science.pdf",
      "description": "All mechanical and 3D Physics subjects and emulations.",
    },
    {
      "name": "LinuxForFun",
      "image": "assets/books/linux_for_fun.jpg",
      "pdf": "assets/pdfs/linux_for_fun.pdf",
      "description": "Linux for learning with joy and practical labs.",
    },
    {
      "name": "Economics",
      "image": "assets/books/economics_book.jpg",
      "pdf": "assets/pdfs/economics_book.pdf",
      "description": "Inside the mind of Economy ideas with Finance concepts.",
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
                image: AssetImage('assets/images/matrix_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to the Library',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CategoriesScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: Colors.greenAccent.shade700,
                  ),
                  child: const Text(
                    'Browse Categories',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Book by Name...',
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onSubmitted: (query) {
                    final result = allBooks.firstWhere(
                      (book) =>
                          book["name"]!.toLowerCase() == query.toLowerCase(),
                      orElse: () => {
                        "name": "Not Found",
                        "image": "assets/books/fiction.jpg",
                        "pdf": "assets/pdfs/fiction.pdf",
                        "description": "Book not found.",
                      },
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BooksScreen(
                          categoryName: result["name"]!,
                          pdfPath: result["pdf"]!,
                          image: result["image"]!,
                          description: result["description"]!,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(
        showPrevious: true,
        showNext: true,
        onPrevious: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const WelcomeScreen()),
          );
        },
        onNext: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CategoriesScreen()),
          );
        },
      ),
    );
  }
}
