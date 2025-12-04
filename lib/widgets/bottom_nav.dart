import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final bool showPrevious;
  final bool showNext;

  const BottomNav({
    super.key,
    this.onPrevious,
    this.onNext,
    this.showPrevious = true,
    this.showNext = true,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showPrevious)
              ElevatedButton(
                onPressed: onPrevious,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade700,
                ),
                child: const Text(
                  'Previous',
                  style: TextStyle(color: Colors.black),
                ),
              )
            else
              const SizedBox(width: 100),
            if (showNext)
              ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade700,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.black),
                ),
              )
            else
              const SizedBox(width: 100),
          ],
        ),
      ),
    );
  }
}
