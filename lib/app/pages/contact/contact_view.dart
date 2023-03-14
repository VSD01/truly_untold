import 'package:flutter/material.dart';
import 'package:practise1/app/app.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ContactWidget(),
    );
  }
}
