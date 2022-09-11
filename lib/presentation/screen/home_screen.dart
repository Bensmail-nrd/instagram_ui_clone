import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/presentation/screen/end_drawer.dart';

import 'drawer.dart';
import 'explore.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [Story(), Explore(), Chat()],
        ),
      ),
    );
  }
}
