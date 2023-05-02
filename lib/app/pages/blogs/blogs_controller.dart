import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogsController extends GetxController {

  /// all hover related variables 
  bool isMainHover=false;

  ///Varible for current page ///
  var currentPage=0;

  /// Timer to naimate images automatically ///
  Timer?timer;

  ///page controller to circulate images //
  var pageController=PageController();
  /// 
  Stream<List<BlogsResponse>> allBlogs() => FirebaseFirestore.instance
      .collection('blogs').orderBy('timeStamp',descending: true,)
      .snapshots()
      .map((snapShot) => snapShot.docs
          .map((doc) => BlogsResponse.fromJson(doc.data()))
          .toList());


          /// Function to animate images auto ///
          void nextImage(){
            pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
            update();
          }

          ///Function to update dots ///
          void updateDots(value)
          {
            currentPage=value;
            update();
          }


          @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer.periodic(const Duration(seconds: 3), (timer) { 
      currentPage==3?pageController.jumpToPage(0):nextImage();
    });
  }
}



class BlogsResponse {
  BlogsResponse({
    required this.descriptionPara1,
    required this.descriptionPara2,
    required this.date,
    required this.id,
    required this.subtitle,
    required this.title,
    required this.coverImage,
    required this.image2,
    required this.image3,
    required this.image4,
  });
  String id;
  final String title;
  final String descriptionPara1;
  final String descriptionPara2;
  final String date;
  final String subtitle;
  final String coverImage;
  final String image2;
  final String image3;
  final String image4;

  static BlogsResponse fromJson(Map<String, dynamic> json) => BlogsResponse(
        descriptionPara1: json['descriptionPara1'],
        descriptionPara2: json['descriptionPara2'],
        date: json['date'],
        id: json['id'],
        subtitle:json['subTitle'],
        title: json['title'],
        coverImage: json['coverImage'],
        image2: json['image2'],
        image3: json['image3'],
        image4: json['image4'],
      );
}



List<String> footerImageList=[
  'assets/facebook.png',
  'assets/instagram.png',
  'assets/spotify.png',
  'assets/twitter.png',
  'assets/youtube.png',
];
