import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class GalleryController extends GetxController{

 // All controllers will stay here
  late VideoPlayerController vedioController;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    vedioController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
       update();
      });
  }
}