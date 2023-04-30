import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  var drawerPageKey = GlobalKey<ScaffoldState>();
  var isIpmatched = true;
  Box? box;

  String? id = '';

  @override
  void onInit() async {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);

    super.onInit();
    box = Hive.box('ttu');
  }
}
