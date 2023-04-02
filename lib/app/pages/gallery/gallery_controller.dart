import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class GalleryController extends GetxController{

 // All controllers will stay here
 // late VideoPlayerController vedioController;


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
    // vedioController = VideoPlayerController.network(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //    update();
    //   });
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
        description: json['description'],
        id: json['id'],
        imageUrl:json['imageUrl'],
        title: json['title'],
      );
}
