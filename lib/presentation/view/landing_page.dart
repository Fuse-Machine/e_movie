import 'package:e_movie/presentation/view/MyHomePage.dart';
import 'package:e_movie/presentation/widgets/bottom_menu.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      bottomNavigationBar: BottomMenu(),
      body:  MyHomePage(),
    );
  }
}
