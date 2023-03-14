import 'package:flutter/material.dart';
import 'package:practise1/app/app.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GalleryWidget(),
    );
  }
}
