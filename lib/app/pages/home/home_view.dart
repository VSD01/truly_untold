import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Responsive.isMobile(context) ? mobileAppBarWidget() : Container(),
      appBar: AppBar(
        automaticallyImplyLeading: Responsive.isMobile(context) ? true : false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Responsive.isWeb(context) ? webAppBar() : Container(),
      ),
      backgroundColor: Colors.black,
      body: HomeWidget(),
    );
  }
}

Widget webAppBar() {
  return Row(
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
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 100,
          ),
          Text(
            'Blog',
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 100,
          ),
          Text(
            'Contact',
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Spacer(),
    ],
  );
}

Widget mobileAppBarWidget() {
  return Drawer(
    backgroundColor: Colors.white.withOpacity(0.7),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.dialog(
              Container(
                color: Colors.black.withOpacity(0.5),
              ),
            );
          },
          child: Text(
            'About',
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 100,
        ),
        Text(
          'Gallery',
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 100,
        ),
        Text(
          'Blog',
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 100,
        ),
        Text(
          'Contact',
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
