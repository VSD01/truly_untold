import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:video_player/video_player.dart';


class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  var drawerPageKey = GlobalKey<ScaffoldState>();
var isIpmatched=true;
      
   getIpAdress()async{
var ipAddress =  IpAddress();
   dynamic data = await ipAddress.getIpAddress() as String ? ?? '';
  if(data=='122.173.29.168'){
 isIpmatched=true;
  }else
  {isIpmatched=false;
    
  }
  }

  // All controllers will stay here
  late VideoPlayerController vedioController;


  @override
  void onInit()async {
   
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    getIpAdress();
    
 vedioController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
       update();
      });
   
  
  
    super.onInit();
  }
}
