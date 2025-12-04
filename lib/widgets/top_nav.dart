import 'package:flutter/material.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TopNav({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), centerTitle: true);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
