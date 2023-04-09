import 'package:flutter/material.dart';
import 'package:practise1/app/app.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: AboutWidget(),
    );
  }
}
