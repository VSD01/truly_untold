import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  @override
  void onInit() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    super.onInit();
  }
}
