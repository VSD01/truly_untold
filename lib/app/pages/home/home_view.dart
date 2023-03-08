import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/pages/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      Container(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    );
                  },
                  child: Text(
                    'About',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  'Gallery',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  'Blog',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  'Contact',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: HomeWidget(),
    );
  }
}
