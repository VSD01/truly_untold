import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:hive/hive.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart'  as http;


class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  var drawerPageKey = GlobalKey<ScaffoldState>();
var isIpmatched=true;
  Box? box;
      
  

  String? id='';

  // This function will be called when the floating button is pressed
  void getInfo() async {
    // Get device id
    String? result = await PlatformDeviceId.getDeviceId;

    // Update the UI
   
      id = result;
      print('id -------------  $result');
    
  }


 




  @override
  void onInit()async {
   
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    getInfo();
    
     
   
  
  
    super.onInit();
    box=Hive.box('ttu');
     }
}
