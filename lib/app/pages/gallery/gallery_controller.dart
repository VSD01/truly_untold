import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class GalleryController extends GetxController{

 // All controllers will stay here
 // late VideoPlayerController vedioController;

 var flipController =FlipCardController();
 Timer?timer;


 Stream<List<GalleryResponse>> allImages() => FirebaseFirestore.instance
      .collection('gallery')
      .snapshots()
      .map((snapShot) => snapShot.docs
          .map((doc) => GalleryResponse.fromJson(doc.data()))
          .toList());


          @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer.periodic(Duration(seconds: 2), (timer) { 
      flipController.toggleCard();
    });
  }


}

class GalleryResponse {
  GalleryResponse({
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.title,
  });
  String id;
  final String title;
  final String description;
  final String imageUrl;
 

  static GalleryResponse fromJson(Map<String, dynamic> json) => GalleryResponse(
        description: json['description'] as String ? ?? '',
        id: json['id'],
        imageUrl:json['imageUrl'],
        title: json['title'] as String ? ?? '',
      );
}
