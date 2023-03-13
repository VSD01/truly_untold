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
              Get.dialog(AboutScreen());
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
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
    child: Drawer(
      width: Dimens.percentWidth(.40),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Dimens.boxHeight20,
          Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Image.asset('assets/logo.png')),
          Dimens.boxHeight20,
          GestureDetector(
            onTap: () {
              Get.back();
              Get.dialog(
                Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              );
            },
            child: Text(
              'About',
              style: AppTextStyle.black_17_700,
            ),
          ),
          Dimens.boxHeight15,
          Text(
            'Gallery',
            style: AppTextStyle.black_17_700,
          ),
          Dimens.boxHeight15,
          Text(
            'Blog',
            style: AppTextStyle.black_17_700,
          ),
          Dimens.boxHeight15,
          Text(
            'Contact',
            style: AppTextStyle.black_17_700,
          ),
        ],
      ),
    ),
  );
}
